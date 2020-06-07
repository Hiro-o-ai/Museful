class CommentsController < ApplicationController
  def create
  end

  def destroy
  end

  def update
  end

  private
  def comment_params
    params.require(:comment).permit(:title, :content, :rate)
  end
end
