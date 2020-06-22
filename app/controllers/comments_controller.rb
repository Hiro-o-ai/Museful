class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = current_user.comments.new(comment_params)
    @comment.article_id = @article.id
    @comment.save
    @article.update(avarage_rate: @article.comments.average(:rate))
  end

  def destroy
    @comment = Comment.find(params[:id])
    @article = @comment.article
    @comment.destroy
    # comment_formを展開するために使用
    @comment_new = Comment.new
    @article.update(avarage_rate: @article.comments.average(:rate))
  end

  def update
    comment = Comment.find(params[:id])
    comment.update(comment_params)
  end

  private
  def comment_params
    params.require(:comment).permit(:title, :content, :rate)
  end
end
