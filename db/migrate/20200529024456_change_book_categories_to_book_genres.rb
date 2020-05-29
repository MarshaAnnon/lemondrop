class ChangeBookCategoriesToBookGenres < ActiveRecord::Migration[6.0]
  def change
    rename_table :book_categories, :book_genres
  end
end
