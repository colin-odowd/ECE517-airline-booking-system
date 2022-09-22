class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :flight
    has_many :baggages

    enum ticket_class: [ :class_first, :class_business, :class_economy ]
    enum amenities: [ :amenities_none, :amenities_wifi, :amenities_meal_preference, :amenities_extra_legroom ]
end
