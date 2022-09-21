class AddIdToFlights < ActiveRecord::Migration[7.0]
  def change
    add_column :flights, :flight_id, :string
    add_index :flights, :flight_id, unique: true
  end
end
