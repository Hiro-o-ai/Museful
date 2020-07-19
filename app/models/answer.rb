class Answer < ApplicationRecord
  # ポリモーフィック関連づけ
  include Likeable

  validates :content, presence: true

  # マジックナンバーになることを防ぐため
  enum status: { アンサー: 1, ベストアンサー: 2 }

  belongs_to :question
  belongs_to :user

  # 通知関係のポリモーフィック
  has_one :notification, as: :notifiable, dependent: :destroy
  # モデルに紐づくインスタンスがcreateされた後で実行する
  after_create_commit :create_notifications

  private

  # userはされる方のuserなので、questionに紐づくユーザーIDを持ってきている
  # selfでanswerのidとtypeが入る
  def create_notifications
    Notification.create(notifiable: self, user: question.user, action: :answered)
  end
end
