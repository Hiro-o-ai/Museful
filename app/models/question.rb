class Question < ApplicationRecord
  is_impressionable counter_cache: true

  validates :title, :content, :genre_ids, presence: true

  enum status:{回答受付中: 1, 解決済み: 2}

  has_many :answers, dependent: :destroy
  has_many :question_genres, dependent: :destroy
  has_many :responses, dependent: :destroy
  # genre_idsメソッドを使用可能にするため
  has_many :genres, :through => :question_genres

  belongs_to :user

  # 質問ジャンルにジャンル情報を保存するために必要
  accepts_nested_attributes_for :question_genres

  # current_userが質問に既に共感したのかを確認するためのメソッド
  def resonded_by?(user)
    responses.where(user_id: user.id).exists?
  end

  # current_userが質問に既に回答したのかを確認するためのメソッド
  def answered_by?(user)
    answers.where(user_id: user.id).exists?
  end

  # 質問を曖昧検索
  def Question.search(search, user_or_article_or_question)
    if user_or_article_or_question == "3"
      Question.where(['title LIKE ?', "%#{search}%"]).or(Question.where(['content LIKE ?', "%#{search}%"]))
    end
  end
end
