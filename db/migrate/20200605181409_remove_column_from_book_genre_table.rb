class RemoveColumnFromBookGenreTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :book_genres, :sub_genre
  end
end
