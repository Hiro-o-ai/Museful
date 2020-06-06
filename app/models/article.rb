class Article < ApplicationRecord
  validates :title, :content, :genre_ids, presence: true

  has_many :article_genres, dependent: :destroy
  # genre_idsメソッドを使用化にするため
  has_many :genres, :through => :article_genres
  belongs_to :user

  # 記事ジャンルにジャンル情報を保存するために必要
  accepts_nested_attributes_for :article_genres
end
