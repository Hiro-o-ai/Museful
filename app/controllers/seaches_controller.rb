class SeachesController < ApplicationController
  include Rearrange

  def top
    @article_genres = Genre.where(case: "記事", status: "有効")
    @question_genres = Genre.where(case: "質問", status: "有効")
  end

  def search
    @article_or_question = params[:option]
    search = params[:search]
    session[:search] = search
    if @article_or_question == "記事"
      @articles = Article.includes(:article_genres).search(search, @article_or_question).page(params[:page]).per(5)
    else
      @questions = Question.includes(:question_genres).search(search, @article_or_question).page(params[:page]).per(5)
    end
  end

  def article_sort
    search = session[:search]
    @search_articles = Article.includes(:article_genres).search(search, "記事")
    selection = params[:keyword]
    case selection
    when "new"
      @articles = @search_articles.order(created_at: :desc).page(params[:page]).per(5)
    when "old"
      @articles = @search_articles.order(created_at: :asc).page(params[:page]).per(5)
    when "likes"
      article_rearrange("like", "Descending")
    when "dislikes"
      article_rearrange("like", "Ascending")
    when "bookmarks"
      article_rearrange("bookmark", "Descending")
    when "disbookmarks"
      article_rearrange("bookmark", "Ascending")
    when "rates"
      @articles = @search_articles.order(avarage_rate: :desc).page(params[:page]).per(5)
    when 'disrates'
      @articles = @search_articles.order(avarage_rate: :asc).page(params[:page]).per(5)
    end
    @article_or_question = "記事"
    render "search"
  end

  def question_sort
    search = session[:search]
    @search_questions = Question.includes(:question_genres).search(search, "質問")
    selection = params[:keyword]
    case selection
    when "new"
      @questions = @search_questions.order(created_at: :desc).page(params[:page]).per(5)
    when "old"
      @questions = @search_questions.order(created_at: :asc).page(params[:page]).per(5)
    when "responses"
      question_rearrange("response", "Descending")
    when "disresponses"
      question_rearrange("response", "Ascending")
    when "unsolve"
      question_collect
      @questions = Question.where(id: @questions_id, status: "回答受付中").page(params[:page]).per(5)
    when "solve"
      question_collect
      @questions = Question.where(id: @questions_id, status: "解決済み").page(params[:page]).per(5)
    end
    @article_or_question = "質問"
    render "search"
  end
end
