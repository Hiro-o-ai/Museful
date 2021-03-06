class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :status, presence: true
  validates :nickname, uniqueness: true

  # refileで画像をアップする際に必要
  attachment :image

  # マジックナンバーになることを防ぐため
  enum status: { 有効: 1, 退会済: 2 }

  has_many :answers, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :browsing_histories, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :responses, dependent: :destroy

  # ゲストユーザー作成
  def self.guest
    find_or_create_by!(nickname: "ゲストユーザー", email: "guest@move.com") do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

  # ユーザーを曖昧検索
  def self.search(search, user_or_article_or_question)
    if user_or_article_or_question == "会員"
      where(['nickname LIKE ?', "%#{search}%"])
    end
  end
end
