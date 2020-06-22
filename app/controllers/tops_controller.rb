class TopsController < ApplicationController
  def top
    @favorite_articles
    @bookmark_articles
    @avarage_rate_articles

    @new_questions
    @respond_questions
  end
end
