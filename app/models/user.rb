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

end
