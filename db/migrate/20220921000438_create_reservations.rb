class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.integer :number_of_passengers
      t.integer :ticket_class
      t.integer :amenities
      t.numeric :cost
      
      t.timestamps
    end
    add_reference :reservations, :user, null: false, foreign_key: true
    add_reference :reservations, :flight, null: false, foreign_key: true
  end
end
