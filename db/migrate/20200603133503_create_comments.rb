class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.integer :target_id
      t.string :title
      t.text :content
      t.float :rate
      t.integer :flag

      t.timestamps
    end
  end
end
