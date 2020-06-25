class AddIndexToGenre < ActiveRecord::Migration[5.2]
  def change
    add_index :genres, :case
    add_index :genres, :status
  end
end
