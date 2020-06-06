class Question < ApplicationRecord
  validates :title, :content, :genre_ids, presence: true

  enum status:{回答受付中: 1, 解決済み: 2}

  has_many :question_genres, dependent: :destroy
  # genre_idsメソッドを使用化にするため
  has_many :genres, :through => :question_genres
  belongs_to :user

  # 質問ジャンルにジャンル情報を保存するために必要
  accepts_nested_attributes_for :question_genres
end
