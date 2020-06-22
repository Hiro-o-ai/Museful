class AddAvarageRateToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :avarage_rate, :float, null:false, default: 0
  end
end
