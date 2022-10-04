class ReservationCreateValidator < ActiveModel::Validator
  def validate(reservation)
    return unless reservation.errors.blank?

    if reservation.flight.passengers + reservation.passengers > reservation.flight.capacity
        reservation.errors.add :base, "Too many passengers"
    end
  end
end

class ReservationUpdateValidator < ActiveModel::Validator
    def validate(reservation)
      return unless reservation.errors.blank?

      if reservation.flight.passengers + (reservation.passengers - reservation.old_passengers) > reservation.flight.capacity
        reservation.errors.add :base, "Too many passengers"
      end
    end
  end

class Reservation < ApplicationRecord
    attr_accessor :old_passengers

    belongs_to :user
    belongs_to :flight
    has_many :baggages, dependent: :destroy

    enum ticket_class: [ :'First', :'Business', :'Economy' ]
    enum amenities: [ :'None', :'Wifi', :'Meal Preference', :'Extra Legroom' ]

    validates :user, presence: true
    validates :flight, presence: true
    validates :passengers, presence: true
    validates :ticket_class, presence: true
    validates :amenities, presence: true

    validates :passengers, comparison: { greater_than: 0 }
    validates_with ReservationCreateValidator, on: :create
    validates_with ReservationUpdateValidator, on: :update

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
