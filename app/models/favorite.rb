class Favorite < ApplicationRecord

  belongs_to :article
  belongs_to :user


  # 通知関係のポリモーフィック
  has_one :notification, as: :notifiable, dependent: :destroy
  # モデルに紐づくインスタンスがcreateされた後で実行する
  after_create_commit :create_notifications
  private
  def create_notifications
    Notification.create(notifiable: self, user: article.user, action: :favorited)
  end
end
