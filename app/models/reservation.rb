class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :flight
    has_many :baggages, dependent: :delete_all

    enum ticket_class: [ :'First', :'Business', :'Economy' ]
    enum amenities: [ :'None', :'Wifi', :'Meal Preference', :'Extra Legroom' ]

    validates :passengers, presence: true
    validates :ticket_class, presence: true
    validates :amenities, presence: true

    trigger.after(:insert) do
        "UPDATE flights SET passengers = passengers + NEW.passengers WHERE id = NEW.flight_id;"
    end

    trigger.after(:update) do
        "UPDATE flights SET passengers = passengers + NEW.passengers - OLD.passengers WHERE id = NEW.flight_id;"
    end

    trigger.after(:delete) do
        "UPDATE flights SET passengers = passengers - OLD.passengers WHERE id = OLD.flight_id;"
    end

    def baggage_cost
        if self.baggages.empty?
            return 0
        end
        
        self.baggages.map { |x| x.cost }.inject(:+)
    end

    def cost
        self.passengers * self.flight.cost + baggage_cost
    end
end
