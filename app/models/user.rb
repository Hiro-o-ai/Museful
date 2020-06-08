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
  enum status:{ 有効: 1, 退会済: 2}


  has_many :articles, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :browsing_histories, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :responses, dependent: :destroy
end
