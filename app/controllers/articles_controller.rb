class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def article_params
    params.require(:article).permit(:title, :content, :image)
  end
end
