require 'rails_helper'

RSpec.describe User, :type => :model do
    it 'is valid with valid attributes and no cc' do
        user = User.new(email: 'test@gmail.com', password: 'password')
        expect(user).to be_valid
    end

    it 'is valid with valid attributes and cc' do
        user = User.new(email: 'test@gmail.com', password: 'password', credit_card: '1234-5678-9876-5432')
        expect(user).to be_valid
    end

    it 'is not valid without a password' do
        user = User.new(email: 'test@gmail.com')
        expect(user).to_not be_valid
    end

    it 'is not valid without an email' do
        user = User.new(password: 'password')
        expect(user).to_not be_valid
    end

    it 'is not valid with an invalid email' do
        user = User.new(email: 'test@gmail', password: 'password')
        expect(user).to_not be_valid
    end

    it 'is not valid with an invalid credit card' do
        user = User.new(email: 'test@gmail.com', password: 'password', credit_card: '0000')
        expect(user).to_not be_valid
    end
end