class Admins::SeachesController < ApplicationController
  def top
  end
  
  def search
    @user_or_article_or_question = params[:option]
    search = params[:search]
    if @user_or_article_or_question == "会員"
      @users = User.search(search, @user_or_article_or_question)
    elsif @user_or_article_or_question == "記事"
      @articles = Article.search(search, @user_or_article_or_question)
    else
      @questions = Question.search(search, @user_or_article_or_question)
    end
  end
end
