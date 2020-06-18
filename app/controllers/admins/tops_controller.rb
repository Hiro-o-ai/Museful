class Admins::TopsController < ApplicationController
  def top
    @users = User.all
    @articles = Article.all
    @questions = Question.all
  end
end
