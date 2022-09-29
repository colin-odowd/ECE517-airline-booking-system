require 'rails_helper'

RSpec.describe User, :type => :model do
    it 'is valid with valid attributes' do
        user = User.new(email: 'test@gmail.com', password: 'password')
        expect(user).to be_valid
    end

    it 'is not valid without a password' do
        
    end
    
    it 'is not valid without an email'
    it 'is not valid with an invalid email'
    it 'is not valid with an invalid credit card'
end