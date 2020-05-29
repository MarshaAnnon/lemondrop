class Book < ApplicationRecord
    has_many :book_genres
    has_many :genres, through: :book_genres
    has_many :quotes
    has_many :users, through: :quotes

    #accepts_nested_attributes_for :genres

    def genres_attributes=(genre_attributes)
        genre_attributes.values.each do | genre_attribute |
            if genre_attribute["name"].present?
                genre = genre.find_or_create_by(genre_attribute)
                self.categories << genre
            end
        end
    end
end
