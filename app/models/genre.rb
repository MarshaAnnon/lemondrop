class Genre < ApplicationRecord
    has_many :book_genres
    has_many :books, through: :book_genres

    validates :name, presence: true

    scope :genre, -> { where("books = '?'", title) }
    
    #scope method to return all the books associate with a genre
end
