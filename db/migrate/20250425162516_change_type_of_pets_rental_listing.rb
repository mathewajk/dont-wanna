class ChangeTypeOfPetsRentalListing < ActiveRecord::Migration[8.0]
  def change
    change_column :rental_listings, :pets, :string, default: "No"
  end
end
