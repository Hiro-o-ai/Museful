class CreateQuestionGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :question_genres do |t|
      t.integer :question_id
      t.integer :genre_id

      t.timestamps
    end
  end
end
