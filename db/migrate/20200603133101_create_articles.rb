class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.references :user, foreign_key: true
      t.references :genre, foreign_key: true
      t.string :title
      t.text :content
      t.string :image_id

      t.timestamps
    end
  end
end
