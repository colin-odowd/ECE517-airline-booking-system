class Flight < ApplicationRecord
    has_many :reservations, dependent: :delete_all

    enum flight_class: [ :jumbo, :private_, :small ]
    enum status: [ :available, :complete ]
end
