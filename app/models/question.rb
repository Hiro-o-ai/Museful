class Question < ApplicationRecord
  validates :title, :content, :genre_ids, presence: true

  enum status:{回答受付中: 1, 解決済み: 2}

  has_many :question_genres, dependent: :destroy
  # genre_idsメソッドを使用可能にするため
  has_many :genres, :through => :question_genres
  has_many :answers, dependent: :destroy
  has_many :responses, dependent: :destroy
  belongs_to :user

  # 質問ジャンルにジャンル情報を保存するために必要
  accepts_nested_attributes_for :question_genres

  # current_userが質問に既に共感したのかを確認するためのメソッド
  def resonded_by?(user)
    responses.where(user_id: user.id).exists?
  end

  def answered_by?(user)
    answers.where(user_id: user.id).exists?
  end
end
