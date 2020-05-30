class Book < ApplicationRecord
    has_many :book_genres
    has_many :genres, through: :book_genres
    has_many :quotes
    belongs_to :user

    #accepts_nested_attributes_for :genres
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
