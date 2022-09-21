class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :flight

    enum :class [ :first, :business, :economy ]
    enum :amenities [ :none, :wifi, :meal_preference, :extra_legroom ]
end
