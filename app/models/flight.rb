class Flight < ApplicationRecord
    has_many :reservations, dependent: :destroy

    enum flight_class: [ :'Jumbo', :'Private', :'Small' ]

    validates :manufacturer, presence: true
    validates :source, presence: true
    validates :destination, presence: true
    validates :source, comparison: { other_than: :destination }
    validates :cost, comparison: { greater_than: 0 }
    validates :cost_by_baggage_weight, comparison: { greater_than: 0 }
    validates :capacity, comparison: { greater_than: 0 }
    validates :passengers, comparison: { greater_than_or_equal_to: 0 }
    validates :passengers, comparison: { less_than_or_equal_to: :capacity }
end
