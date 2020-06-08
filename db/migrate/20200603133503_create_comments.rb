class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :article_id
      t.string :title, null: false
      t.text :content, null: false
      t.float :rate, null: false

      t.timestamps
    end
  end
end
