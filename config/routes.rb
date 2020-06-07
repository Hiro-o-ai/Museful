Rails.application.routes.draw do
  root "tops#top"


  # deviseに関わるものが複数あるので、それぞれでコントローラーとルーティングが必要
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
  }

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }


  resources :users, only: [:show, :edit, :update] do
    get "/leave" => "users#leave"
    patch "/leave" => "users#leave_update"
  end

  resources :articles do
    resource :favorites, only: [:create, :destroy]
    resource :comments, only: [:index, :create, :destroy, :edit, :update]
  end

  resources :questions do
    resource :responses, only: [:create, :destroy]
    resource :answers, only: [:index, :create, :destroy, :edit, :update]
  end


  namespace :admins do
    get "/" => "tops#top"
    resources :users, only: [:index, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :articles, only: [:index, :show, :destroy]
    resources :questions, only: [:index, :show, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
