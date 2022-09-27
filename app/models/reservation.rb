class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :flight
    has_many :baggages, dependent: :delete_all

    enum ticket_class: [ :'First', :'Business', :'Economy' ]
    enum amenities: [ :'None', :'Wifi', :'Meal Preference', :'Extra Legroom' ]
end
