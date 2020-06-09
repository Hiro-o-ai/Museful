class Response < ApplicationRecord

  belongs_to :question
  belongs_to :user

  # 通知関係のポリモーフィック
  has_one :notification, as: :notifiable, dependent: :destroy
  # モデルに紐づくインスタンスがcreateされた後で実行する
  after_create_commit :create_notifications
  private
  def create_notifications
    Notification.create(notifiable: self, user: question.user, action: :responsed)
  end
end
