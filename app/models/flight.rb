class Flight < ApplicationRecord
    has_many :reservations

    enum class: [ :jumbo, :private, :small ]
    enum status: [ :available, :complete ]
end
