class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.references :article, foreign_key: true
      t.string :title, null: false
      t.text :content, null: false
      t.float :rate, null: false

      t.timestamps
    end
  end
end
