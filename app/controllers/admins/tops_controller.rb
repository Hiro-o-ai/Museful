class Admins::TopsController < ApplicationController
  def top
    @most_viewed = Article.order('impressions_count DESC').take(10)
    @created_count = Impression.where(controller_name: :articles, action_name: :create)
  end
end
