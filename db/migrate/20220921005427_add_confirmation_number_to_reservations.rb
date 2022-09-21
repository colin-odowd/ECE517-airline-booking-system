class AddConfirmationNumberToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :confirmation_number, :string
    add_index :reservations, :confirmation_number, unique: true
  end
end
