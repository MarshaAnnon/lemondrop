class Book < ApplicationRecord
    has_many :book_genres
    has_many :genres, through: :book_genres
    has_many :quotes
    belongs_to :user

    validates :title, presence: true
    validates :author, presence: true
    

    #scope :author_name, -> { where("author = '?'", author) }
    scope :book_description, -> { where("description > 0") }
    #scope :book_quote, -> { where(quote: true) }

    #looking for a scope method that returns all the books associated with an author
    #looking for a scope method that returns the books with a description present
    #looking for a scope method that returns the books with a quote present

    accepts_nested_attributes_for :book_genres
    accepts_nested_attributes_for :quotes

    def genres_attributes=(genre_attributes)
        genre_attributes.values.each do | genre_attribute |
            if genre_attribute["name"].present?
                genre = Genre.find_or_create_by(genre_attribute)
                self.genres << genre
            end
        end
    end
end
