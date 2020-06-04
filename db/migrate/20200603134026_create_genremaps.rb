class CreateGenremaps < ActiveRecord::Migration[5.2]
  def change
    create_table :genremaps do |t|
      t.integer :target_id, null: false
      t.references :genre, foreign_key: true
      t.integer :type, null: false

      t.timestamps
    end
  end
end
