class Admins::SeachesController < ApplicationController
  def top
  end
  
  def search
    @user_or_article_or_question = params[:option]
    @search = params[:search]
    if @user_or_article_or_question == "1"
      @users = User.search(params[:search], @user_or_article_or_question)
    elsif @user_or_article_or_question == "2"
      @articles = Article.search(params[:search], @user_or_article_or_question)
    else
      @questions = Question.search(params[:search], @user_or_article_or_question)
    end
  end
end
