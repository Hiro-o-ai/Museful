class LikesController < ApplicationController
  # set_likeableはcontrollers/answers/likes_controller.rbとcontrollers/comments/likes_controller.rbに記述
  before_action :set_likeable

  def create
    @like = @likeable.likes.new(user_id: current_user.id)
    @like.save
  end

  def destroy
    @like = @likeable.likes.find_by(user_id: current_user.id)
    @like.destroy
  end
end
