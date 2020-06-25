class AddIndexToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_index :questions, :title
    add_index :questions, :status
  end
end
