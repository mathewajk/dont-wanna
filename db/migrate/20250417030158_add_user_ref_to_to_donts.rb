class AddUserRefToToDonts < ActiveRecord::Migration[8.0]
  def change
    add_reference :to_donts, :user, null: true, foreign_key: true
  end
end
