class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = current_user.comments.new(comment_params)
    @comment.article_id = @article.id
    if @comment.save
      @comment = Comment.new
    else
      render '/articles/show'
    end
  end

  def destroy
    article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  # def update
  #   @article = Article.find(params[:article_id])
  #   @exist_comment = Comment.find_by(user_id: current_user.id, article_id: @article.id)
  #   if @comment.update(comment_params)
  #   else
  #     render '/articles/show'
  #   end
  # end

  private
  def comment_params
    params.require(:comment).permit(:title, :content, :rate)
  end
end
