class Response < ApplicationRecord

  belongs_to :question
  belongs_to :user

  # 通知関係
  # モデルに紐づくインスタンスがcreateされた後で実行する
  after_create_commit :create_notifications

  has_one :notification, as: :notifiable, dependent: :destroy

  private
  def create_notifications
    Notification.create(notifiable: self, user: question.user, action: :responsed)
  end
end
