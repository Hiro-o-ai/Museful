class Comment < ApplicationRecord
  # ポリモーフィック関連づけ
  include Likeable

  validates :content, presence: true

  belongs_to :article
  belongs_to :user

  # 通知関係
  # モデルに紐づくインスタンスがcreateされた後で実行する
  after_create_commit :create_notifications

  has_one :notification, as: :notifiable, dependent: :destroy

  private
  def create_notifications
    Notification.create(notifiable: self, user: article.user, action: :commented)
  end
end
