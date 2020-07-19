Rails.application.routes.draw do
  root "tops#top"

  # deviseに関わるものが複数あるので、それぞれでコントローラーとルーティングが必要
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
  }

  namespace :admins do
    get "/" => "tops#top"
    get "/search" => "seaches#top"
    get "/search/result" => "seaches#search"
    resources :users, only: [:index, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :articles, only: [:index, :show, :destroy]
    resources :questions, only: [:index, :show, :destroy]
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
  }

  # ゲストログイン用
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  resources :users, only: [:show, :edit, :update] do
    get "/leave" => "users#leave"
    patch "/leave" => "users#leave_update"
  end

  resources :articles, shallow: true do
    resource :bookmarks, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy, :update] do
      resource :likes, only: [:create, :destroy], module: :comments
    end
  end

  resources :questions, shallow: true do
    resource :responses, only: [:create, :destroy]
    resources :answers, only: [:create, :destroy, :update] do
      resource :likes, only: [:create, :destroy], module: :answers
    end
  end

  resources :notifications, only: [:index, :update]
  patch "/all_read" => "notifications#all_read"

  resources :genres, only: [:show] do
    get "/narrow_article" => "genres#narrow_article"
    get "/narrow_question" => "genres#narrow_question"
  end

  get "/search" => "seaches#top"
  get "/search/result" => "seaches#search"

  get "/article_sort" => "seaches#article_sort"
  get "/question_sort" => "seaches#question_sort"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
