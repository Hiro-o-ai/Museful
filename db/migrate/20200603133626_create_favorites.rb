class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.references :user, foreign_key: true
      t.integer :target_id, null: false
      t.integer :case, null: false

      t.timestamps
    end
  end
end
