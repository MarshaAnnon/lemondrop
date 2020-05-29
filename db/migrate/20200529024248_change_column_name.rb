class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :book_categories, :category_id, :genre_id
  end
end
