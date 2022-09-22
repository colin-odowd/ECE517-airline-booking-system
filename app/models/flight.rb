class Flight < ApplicationRecord
    has_many :reservations, dependent: :delete_all

    enum flight_class: [ :class_jumbo, :class_private, :class_small ]
    enum status: [ :status_available, :status_complete ]
end
