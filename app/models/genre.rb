class Genre < ApplicationRecord

  validates :name, :case, :status, presence: true
  # マジックナンバーになることを防ぐため
  enum status:{ 有効: 1, 無効: 2}
  enum case:{ 記事: 1, 質問: 2}

  has_many :article_genres, dependent: :destroy
  has_many :question_genres, dependent: :destroy
  has_many :articles, :through => :article_genres
  has_many :questions, :through => :question_genres
end
