require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    it "is valid" do
      user =User.new(name: "name",     
      email: 'test2@test.com',
      password: 'password',
      password_confirmation: 'password')  
      expect(user).to be_valid    
    end

    it "email is missing" do
      user = User.new(email: nil)
      expect(user).to be_invalid
      expect(user.errors.full_messages).to include("Email can't be blank")     
    end

    # it "cant fill with upper case" do
    #   user = User.new(email: 'test@test.COM')
    #   user.save
    #   user1 = User.new(email: "TEST@TEST.com ")
    #   user1.save
    #   expect(user1.errors.full_messages).to be_present
    # end

    it "password don't match" do
        user = User.new(                
          name: 'name',
          email: 'test2@test.com',
          password: 'password',
          password_confirmation: 'pass'
      )
      user.valid?
      expect(user.errors.full_messages).to be_present
    end

    it 'password length less than 4 characters is invalid' do
      user = User.new 
      user.email = 'test@test.com'
      user.password = '123'
      user.password_confirmation = '123'
      expect(user).to be_invalid
    end

    it "fail to save when the email address is not unique" do
      user=User.create(name: 'name',
          email: 'test2@test.com',
          password: 'password',
          password_confirmation: 'pass')
          user.valid?
      expect(user.errors.full_messages).not_to be_empty
    end

  end
  describe '.authenticate_with_credentials' do
    it 'should pass with valid credentials' do
      user = User.new(
        name: 'name'
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      user.save

end