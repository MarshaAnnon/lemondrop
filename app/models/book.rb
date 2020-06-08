class Book < ApplicationRecord
    has_many :book_genres, dependent: :delete_all
    has_many :genres, through: :book_genres, dependent: :delete_all
    has_many :quotes, dependent: :delete_all
    has_many :user_books, dependent: :delete_all
    has_many :users, through: :user_books, dependent: :delete_all

    validates :title, presence: true
    validates :author, presence: true
    
    scope :book_description, -> { where("description > 0") }
    scope :book_title, -> (title) { where("title like ?", "%#{title}%")}

    accepts_nested_attributes_for :book_genres, allow_destroy: true
    accepts_nested_attributes_for :quotes, allow_destroy: true
    accepts_nested_attributes_for :genres, reject_if: proc { |attributes| attributes['name'].blank? }, allow_destroy: true
    accepts_nested_attributes_for :user_books, allow_destroy: true


    #def genres_attributes=(genre_attributes)
    #    genre_attributes.values.each do | genre_attribute |
    #        if genre_attribute["name"].present?
    #            genre = Genre.find_or_create_by(genre_attribute)
    #            self.genres << genre
    #        end
    #    end
    #end
end
