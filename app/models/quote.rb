class Quote < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :book
end
