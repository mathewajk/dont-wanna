class CreateRentalListings < ActiveRecord::Migration[8.0]
  def change
    create_table :rental_listings do |t|
      t.string :address
      t.integer :bedrooms
      t.float :bathrooms
      t.string :notes
      t.boolean :contacted

      t.timestamps
    end
  end
end
