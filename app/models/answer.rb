class Answer < ApplicationRecord
  validates :content, presence: true

  # マジックナンバーになることを防ぐため
  enum status:{ アンサー: 1, ベストアンサー: 2}

  # ポリモーフィック関連づけ
  has_many :likes, as: :likeable, dependent: :destroy

  belongs_to :question
  belongs_to :user

  # current_userが回答に既にナイスしたのかを確認するためのメソッド
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
