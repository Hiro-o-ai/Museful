class Admins::GenresController < ApplicationController
  before_action :authenticate_admin!
  def index
    @genre = Genre.new
    @article_genres = Genre.where(case: "記事")
    @question_genres = Genre.where(case: "質問")
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admins_genres_path
    else
      @article_genres = Genre.where(case: "記事", status: "有効")
      @question_genres = Genre.where(case: "質問", status: "有効")
      render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      @genres = Genre.all
      @genre = Genre.new
      redirect_to admins_genres_path
    else
      render :edit
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name, :case, :status)
  end
end
