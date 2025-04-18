class CreateToDonts < ActiveRecord::Migration[8.0]
  def change
    create_table :to_donts do |t|
      t.string :task
      t.boolean :completed

      t.timestamps
    end
  end
end
