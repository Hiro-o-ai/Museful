class AddIndexToArticle < ActiveRecord::Migration[5.2]
  def change
    add_index :articles, :title
  end
end
