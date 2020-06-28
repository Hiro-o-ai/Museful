class ChangeDataContentToQuestion < ActiveRecord::Migration[5.2]
  def change
    change_column :questions, :content, :text, limit: 16777215
  end
end
