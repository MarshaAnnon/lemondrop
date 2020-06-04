class UserBook < ApplicationRecord
  belongs_to :user
  belongs_to :book

  scope :reading, -> { where(current_book: true) }
end
