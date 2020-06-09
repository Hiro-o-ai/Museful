class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.integer :notifiable_id
      t.string  :notifiable_type
      t.integer :action, null: false
      t.boolean :read, default: false, null: false

      t.timestamps
    end
    add_index :notifications, :user_id
    add_index :notifications, [:notifiable_type, :notifiable_id]
  end
end
