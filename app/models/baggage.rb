class Baggage < ApplicationRecord
    belongs_to :user
    belongs_to :reservation
end
