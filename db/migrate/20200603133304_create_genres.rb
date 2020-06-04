class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.string :name, null: false
      t.integer :type, null: false
      t.integer :flag, null: false, default: 1

      t.timestamps
    end
  end
end
