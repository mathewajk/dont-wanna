class AddDetailsToRentalListing < ActiveRecord::Migration[8.0]
  def change
    add_column :rental_listings, :url, :string
    add_column :rental_listings, :interested, :boolean
    add_column :rental_listings, :available, :boolean
    add_column :rental_listings, :start_date, :date
    add_column :rental_listings, :information_needed, :boolean
    add_column :rental_listings, :pets, :boolean
    add_column :rental_listings, :price, :float
    add_column :rental_listings, :transit, :string
  end
end
