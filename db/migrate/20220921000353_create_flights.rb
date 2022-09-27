class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.string :name
      t.integer :flight_class
      t.string :manufacturer
      t.string :source
      t.string :destination
      t.integer :capacity
      t.integer :passengers
      t.integer :cost

      t.timestamps
    end
    add_check_constraint :flights, "source != destination", name: "source_destination_check"
    add_check_constraint :flights, "cost > 0", name: "cost_check"
    add_check_constraint :flights, "capacity > 0", name: "capacity_check"
    add_check_constraint :flights, "passengers <= capacity", name: "passengers_check"
  end
end
