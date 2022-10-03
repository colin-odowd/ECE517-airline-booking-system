class Baggage < ApplicationRecord
    belongs_to :reservation

    validates :weight, presence: true

    def cost
        self.weight * self.reservation.flight.cost_by_baggage_weight
    end
end
