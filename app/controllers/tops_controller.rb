class TopsController < ApplicationController
  def top
    @favorite_articles = Article.find(Favorite.group(:article_id).order('count(article_id) desc').limit(5).pluck(:article_id))
    @bookmark_articles = Article.find(Bookmark.group(:article_id).order('count(article_id) desc').limit(5).pluck(:article_id))
    @avarage_rate_articles = Article.all.order(avarage_rate: :desc).limit(5)

    @respond_questions = Question.find(Response.group(:question_id).order('count(question_id) desc').limit(5).pluck(:question_id))
    @new_questions = Question.all.order(created_at: :desc).limit(5)
  end
end
