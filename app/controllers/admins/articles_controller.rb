class Admins::ArticlesController < ApplicationController
  before_action :authenticate_admin!
  def index
    @articles = Article.all
  end
  
  def show
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to admins_articles_path
  end
end
