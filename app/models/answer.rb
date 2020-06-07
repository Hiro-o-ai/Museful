class Answer < ApplicationRecord
  validates :content, presence: true

  # マジックナンバーになることを防ぐため
  enum status:{ アンサー: 1, ベストアンサー: 2}

  belongs_to :user
  belongs_to :question
end
