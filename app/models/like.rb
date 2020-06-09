class Like < ApplicationRecord
  # ポリモーフィック関連づけ
  belongs_to :likeable, polymorphic: true
  belongs_to :user

  # 通知関係
  # モデルに紐づくインスタンスがcreateされた後で実行する
  after_create_commit :create_notifications

  has_one :notification, as: :notifiable, dependent: :destroy

  private
  def create_notifications
    Notification.create(notifiable: self, user: likeable.user, action: :liked)
  end
end
