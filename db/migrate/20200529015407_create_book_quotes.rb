class CreateBookQuotes < ActiveRecord::Migration[6.0]
  def change
    create_table :book_quotes do |t|
      t.integer :book_id
      t.integer :category_id

      t.timestamps
    end
  end
end
