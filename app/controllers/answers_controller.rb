class AnswersController < ApplicationController
  def index
  end

  def create
  end

  def destroy
  end

  def edit
  end

  def update
  end

  private
  def answer_params
    params.require(:answer).permit(:title, :content)
  end
end
