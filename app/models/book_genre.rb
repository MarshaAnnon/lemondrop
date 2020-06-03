class BookGenre < ApplicationRecord
    belongs_to :book 
    belongs_to :genre

    scope :is_subgenre, -> { where(sub_genre: true ) }
    scope :main_genre, -> { where(sub_genre: false ) }
end
