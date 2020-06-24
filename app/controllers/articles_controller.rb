class ArticlesController < ApplicationController
  impressionist :actions=>[:show]
  before_action :authenticate_user!, only:[:new, :edit]
  before_action :correct_user, only: [:edit]
  def new
    @article = Article.new
    @genres = Genre.where(case: "記事",status: "有効")
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      redirect_to article_path(@article)
    else
      @genres = Genre.where(case: "記事",status: "有効")
      render :new
    end
  end

  def index
    @articles = Article.order(created_at: :desc).page(params[:page]).per(5)
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    # 閲覧履歴用
    if user_signed_in? && @article.user_id != current_user.id
      unless current_user.browsing_histories.exists?(article_id: @article.id)
        new_history = @article.browsing_histories.new
        new_history.user_id = current_user.id
        new_history.save
      end
      # 閲覧履歴制限用
      histories_stock_limit = 10
      histories = current_user.browsing_histories.all
      if histories.count > histories_stock_limit
        histories[0].destroy
      end
    end
  end

  def edit
    @genres = Genre.where(case: "記事",status: "有効")
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to article_path(@article)
    else
      @genres = Genre.where(case: "記事",status: "有効")
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :content, genre_ids: [])
  end

  def correct_user
    @article = Article.find(params[:id])
    if  @article.user_id != current_user.id
      redirect_to articles_path
    end
  end
end