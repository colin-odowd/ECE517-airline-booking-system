class Flight < ApplicationRecord
    has_many :reservations, dependent: :delete_all

    enum flight_class: [ :'Jumbo', :'Private', :'Small' ]

    validates :cost_by_baggage_weight, presence: true
    validates :cost, presence: true
    validates :capacity, presence: true
end
