class User < ApplicationRecord
    has_secure_password
    has_many :reservations, dependent: :delete_all
    has_many :baggages, dependent: :delete_all
    validates :email, presence: true, uniqueness: true
end
