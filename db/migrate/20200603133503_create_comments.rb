class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.integer :target_id, null: false
      t.string :title, null: false
      t.text :content, null: false
      t.float :rate, null: false
      t.integer :flag, null: false, default: 1

      t.timestamps
    end
  end
end
