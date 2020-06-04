class ChangeColumnInBookGenresTable < ActiveRecord::Migration[6.0]
  def change
    change_column :book_genres, :sub_genre, :string
  end
end
