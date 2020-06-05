class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.references :user, foreign_key: true
      t.references :genre, foreign_key: true
      t.string :title, null: false
      t.text :content, null: false
      t.string :image_id

      t.timestamps
    end
  end
end