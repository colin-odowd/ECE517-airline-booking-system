class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :flight
    has_many :baggages, dependent: :delete_all

    enum ticket_class: [ :'First', :'Business', :'Economy' ]
    enum amenities: [ :'None', :'Wifi', :'Meal Preference', :'Extra Legroom' ]

    trigger.after(:insert) do
        "UPDATE flights SET passengers = passengers + NEW.passengers WHERE id = NEW.flight_id;"
    end

    trigger.after(:update) do
        "UPDATE flights SET passengers = passengers + NEW.passengers - OLD.passengers WHERE id = NEW.flight_id;"
    end

    trigger.after(:delete) do
        "UPDATE flights SET passengers = passengers + OLD.passengers WHERE id = NEW.flight_id;"
    end
end
