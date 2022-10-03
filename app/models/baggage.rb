class Baggage < ApplicationRecord
    belongs_to :reservation

    validates :weight, comparison: { greater_than: 0 }

    def cost
        self.weight * self.reservation.flight.cost_by_baggage_weight
    end
end
