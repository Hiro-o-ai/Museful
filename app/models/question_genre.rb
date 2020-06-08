class QuestionGenre < ApplicationRecord
  belongs_to :genre
  belongs_to :question
end
