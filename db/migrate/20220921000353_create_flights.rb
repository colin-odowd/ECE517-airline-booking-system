class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.string :name
      t.integer :flight_class
      t.string :manufacturer
      t.string :source
      t.string :destination
      t.integer :capacity
      t.integer :status
      t.integer :cost

      t.timestamps
    end
    add_check_constraint :flights, "source != destination", name: "source_destination_check"
  end
end
