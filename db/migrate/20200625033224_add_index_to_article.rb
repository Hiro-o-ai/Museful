class AddIndexToArticle < ActiveRecord::Migration[5.2]
  def change
    add_index :articles, :title
    add_index :articles, :content
  end
end
