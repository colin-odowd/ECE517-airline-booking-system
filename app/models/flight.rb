class Flight < ApplicationRecord
    has_many :reservations, dependent: :delete_all

    enum flight_class: [ :'Jumbo', :'Private', :'Small' ]
    enum status: [ :'Available', :'Complete' ]
end
