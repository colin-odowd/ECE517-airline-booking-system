class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.string :flight_id
      t.string :name
      t.integer :class
      t.string :manufacturer
      t.string :source
      t.string :destination
      t.integer :capacity
      t.integer :status
      t.integer :cost

      t.timestamps
    end
    add_index :flights, :flight_id, unique: true
  end
end
