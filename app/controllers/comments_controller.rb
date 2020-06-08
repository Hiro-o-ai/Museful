class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = current_user.comments.new(comment_params)
    @comment.article_id = @article.id
    if @comment.save
    else
      render '/articles/show'
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    # comment_formを展開するために使用
    @comment_new = Comment.new
  end

  private
  def comment_params
    params.require(:comment).permit(:title, :content, :rate)
  end
end
