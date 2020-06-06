class QuestionGenre < ApplicationRecord
  belongs_to :question
  belongs_to :genre
end
