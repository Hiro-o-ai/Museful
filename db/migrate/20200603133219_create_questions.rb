class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.integer :user_id
      t.string :title, null: false
      t.text :content, null: false
      t.integer :status, null: false, default: 1

      t.timestamps
    end
  end
end
