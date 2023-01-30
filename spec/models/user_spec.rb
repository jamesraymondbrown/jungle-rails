require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do
    it 'should validate that the user has a name and email' do
      @user = User.new()
      @user.save

      expect(@user.errors.full_messages).to include("Name can't be blank", "Email can't be blank")
    end

    it 'should validate that the email is unique' do
      @user = User.new(name: "James", email: "james@james.com", password: "james", password_confirmation: "james")
      @user.save
      @user2 = User.new(name: "James", email: "James@James.com", password: "james", password_confirmation: "james")
      @user2.save

      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end

    it 'should validate that the password and password confirmation are required' do
      @user = User.new()
      @user.save

      expect(@user.errors.full_messages).to include("Password can't be blank", "Password confirmation can't be blank")
    end

    it 'should validate that the password and password confirmation match' do
      @user = User.new(name: "James", email: "james@james.com", password: "james", password_confirmation: "jimmy")
      @user.save

      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

  end

end
