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
      t.integer :status
      t.integer :cost_by_baggage_weight
      t.integer :cost

      t.timestamps
    end
    add_check_constraint :flights, "passengers >= 0", name: "passengers_check"
    add_check_constraint :flights, "passengers <= capacity", name: "passengers_capacity_check"
  end
end
