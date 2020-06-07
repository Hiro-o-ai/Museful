class CommentsController < ApplicationController
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
  def comment_params
    params.require(:comment).permit(:title, :content, :rate)
  end
end
