class Notification < ApplicationRecord
  # モデルでpathを使用するために記述
  include Rails.application.routes.url_helpers
  
  # マジックナンバーになることを防ぐため、管理しやすくするため(stringと比較)
  enum action:{commented: 1, answered: 2, favorited: 3, responsed: 4, liked:5}
  enum read: { unread: false, read: true }

  # ポリモーフィック関連づけ
  belongs_to :notifiable, polymorphic: true
  belongs_to :user

  def redirect_path
    case action.to_sym
    when :commented
      article_path(notifiable.article, anchor: "comment-#{notifiable.id}")
    when :answered
      question_path(notifiable.question, anchor: "answer-#{notifiable.id}")
    when :favorited
      article_path(notifiable.article)
    when :responsed
      question_path(notifiable.question)
    when :liked
      if notifiable.likeable_type == "Comment"
        article_path(notifiable.likeable.article_id)
      else
        question_path(notifiable.likeable.question_id)
      end
    end
  end
end

