class User < ApplicationRecord
    has_secure_password
    has_many :reservations, dependent: :delete_all
    validates :email, presence: true, uniqueness: true
    validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    validates_format_of :credit_card, with: /(^$|(\A([0-9]{4})(-([0-9]{4})){3}))/
end
