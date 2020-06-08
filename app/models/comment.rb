class Comment < ApplicationRecord
  validates :content, presence: true

  # ポリモーフィック関連づけ
  has_many :likes, as: :likeable, dependent: :destroy

  belongs_to :article
  belongs_to :user

  # current_userがコメントに既にナイスしたのかを確認するためのメソッド
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
