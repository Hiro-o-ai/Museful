class Article < ApplicationRecord
  validates :title, :content, :genre_ids, presence: true


  has_many :article_genres, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :browsing_histories, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  # genre_idsメソッドを使用可能にするため
  has_many :genres, :through => :article_genres

  belongs_to :user

  # 記事ジャンルにジャンル情報を保存するために必要
  accepts_nested_attributes_for :article_genres

  # current_userが記事に既にいいねをしたのかを確認するためのメソッド
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  # current_userが記事に既にコメントしたのかを確認するためのメソッド
  def commented_by?(user)
    comments.where(user_id: user.id).exists?
  end

  # current_userが記事に既にブックマークしたのかを確認するためのメソッド
  def bookmarked_by?(user)
    bookmarks.where(user_id: user.id).exists?
  end
end
