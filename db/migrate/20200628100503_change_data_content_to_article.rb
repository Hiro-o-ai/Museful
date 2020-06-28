class ChangeDataContentToArticle < ActiveRecord::Migration[5.2]
  def change
    change_column :articles, :content, :text, limit: 16777215
  end
end
