module Likeable
  extend ActiveSupport::Concern

  included do
    has_many :likes, as: :likeable, dependent: :destroy
  end

  # current_userが既にナイスしたのかを確認するためのメソッド
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end