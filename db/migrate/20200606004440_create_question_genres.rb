class CreateQuestionGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :question_genres do |t|
      t.references :question, foreign_key: true
      t.references :genre, foreign_key: true

      t.timestamps
    end
  end
end
