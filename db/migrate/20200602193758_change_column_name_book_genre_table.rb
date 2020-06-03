class ChangeColumnNameBookGenreTable < ActiveRecord::Migration[6.0]
  def change
    change_column :book_genres, :sub_genre, :boolean
  end
end
