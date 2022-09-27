# This migration was auto-generated via `rake db:generate_trigger_migration'.
# While you can edit this file, any changes you make to the definitions here
# will be undone by the next auto-generated trigger migration.

class CreateTriggersReservationsInsertOrReservationsUpdateOrReservationsDelete < ActiveRecord::Migration[7.0]
  def up
    create_trigger("reservations_after_insert_row_tr", :generated => true, :compatibility => 1).
        on("reservations").
        after(:insert) do
      "UPDATE flights SET passengers = passengers + NEW.passengers WHERE id = NEW.flight_id;"
    end

    create_trigger("reservations_after_update_row_tr", :generated => true, :compatibility => 1).
        on("reservations").
        after(:update) do
      "UPDATE flights SET passengers = passengers + NEW.passengers - OLD.passengers WHERE id = NEW.flight_id;"
    end

    create_trigger("reservations_after_delete_row_tr", :generated => true, :compatibility => 1).
        on("reservations").
        after(:delete) do
      "UPDATE flights SET passengers = passengers - OLD.passengers WHERE id = OLD.flight_id;"
    end
  end

  def down
    drop_trigger("reservations_after_insert_row_tr", "reservations", :generated => true)

    drop_trigger("reservations_after_update_row_tr", "reservations", :generated => true)

    drop_trigger("reservations_after_delete_row_tr", "reservations", :generated => true)
  end
end
