class GenresController < ApplicationController
  def show
    @genre = Genre.find(params[:id])
    @articles = @genre.articles
    @questions = @genre.questions
  end
end
