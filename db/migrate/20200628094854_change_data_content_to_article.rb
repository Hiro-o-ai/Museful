class ChangeDataContentToArticle < ActiveRecord::Migration[5.2]
  def change
    change_column :articles, :content, :medium_text, limit: 16777215
  end
end
