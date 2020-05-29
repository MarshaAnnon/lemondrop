class Book < ApplicationRecord
    has_many :book_genres
    has_many :genres, through: :book_genres
    has_many :quotes
    has_many :users, through: :quotes

    def categories_attributes=(category_attributes)
        category_attributes.values.each do | category_attribute |
            if category_attribute["name"].present?
                category = Category.find_or_create_by(category_attribute)
                self.categories << category
            end
        end
    end
end
