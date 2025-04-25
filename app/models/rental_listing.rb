class RentalListing < ApplicationRecord
    validates :address, :start_date, :bedrooms, :bathrooms, :pets, :price, presence: true
    has_rich_text :notes
end
