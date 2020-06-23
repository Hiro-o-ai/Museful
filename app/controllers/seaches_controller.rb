class SeachesController < ApplicationController
  def top
  end
  
  def search
    @article_or_question = params[:option]
    search = params[:search]
    if @article_or_question == "2"
      @articles = Article.search(search, @article_or_question)
    else
      @questions = Question.search(search, @article_or_question)
    end
  end
end
