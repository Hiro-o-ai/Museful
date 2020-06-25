class AddIndexToBookMark < ActiveRecord::Migration[5.2]
  def change
    add_index :bookmarks, :user_id
    add_index :bookmarks, :article_id
  end
end
