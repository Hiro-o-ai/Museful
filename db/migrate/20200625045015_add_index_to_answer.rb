class AddIndexToAnswer < ActiveRecord::Migration[5.2]
  def change
    add_index :answers, :user_id
    add_index :answers, :status
  end
end
