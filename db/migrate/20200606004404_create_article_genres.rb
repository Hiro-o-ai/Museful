class CreateArticleGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :article_genres do |t|
      t.integer :article_id
      t.integer :genre_id

      t.timestamps
    end
  end
end
