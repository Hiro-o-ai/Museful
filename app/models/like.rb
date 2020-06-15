class Like < ApplicationRecord
  # ポリモーフィック関連づけ
  belongs_to :likeable, polymorphic: true
  belongs_to :user

  # 通知関係のポリモーフィック
  has_one :notification, as: :notifiable, dependent: :destroy
  # モデルに紐づくインスタンスがcreateされた後で実行する
  after_create_commit :create_notifications
  private
  # likeableはcommentかanswerのidやtypeが保存されている
  # userはされる方のuserなので、commentやanswerに紐づくユーザーIDを持ってきている
  # selfでcommentやanswerのidとtypeが入る
  def create_notifications
    Notification.create(notifiable: self, user: likeable.user, action: :liked)
  end
end
