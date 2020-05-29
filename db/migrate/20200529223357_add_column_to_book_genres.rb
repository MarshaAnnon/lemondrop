class AddColumnToBookGenres < ActiveRecord::Migration[6.0]
  def change
    add_column :book_genres, :sub_genre, :boolean
  end
end
