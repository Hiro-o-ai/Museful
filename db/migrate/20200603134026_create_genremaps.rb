class CreateGenremaps < ActiveRecord::Migration[5.2]
  def change
    create_table :genremaps do |t|
      t.integer :target_id
      t.references :genre, foreign_key: true
      t.integer :type

      t.timestamps
    end
  end
end
