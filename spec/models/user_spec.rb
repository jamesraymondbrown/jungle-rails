require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do
    it 'should validate that the user has a first name, last name, and email' do
      @user = User.new()
      @user.save

      expect(@user.errors.full_messages).to include("First name can't be blank", "Last name can't be blank", "Email can't be blank")
    end

    it 'should validate that the email is unique' do
      @user = User.new(first_name: "James", last_name: "Brown", email: "james@james.com", password: "james", password_confirmation: "james")
      @user.save
      @user2 = User.new(first_name: "James", last_name: "Brown", email: "James@James.com", password: "james", password_confirmation: "james")
      @user2.save

      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end

    it 'should validate that the password and password confirmation are required' do
      @user = User.new()
      @user.save

      expect(@user.errors.full_messages).to include("Password can't be blank", "Password confirmation can't be blank")
    end

    it 'should validate that the password and password confirmation match' do
      @user = User.new(first_name: "James", last_name: "Brown", email: "james@james.com", password: "james", password_confirmation: "jimmy")
      @user.save

      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'should validate that the password length is 5 or more' do
      @user = User.new(first_name: "James", last_name: "Brown", email: "james@james.com", password: "jim", password_confirmation: "jim")
      @user.save

      expect(@user.errors.full_messages).to include("Password is too short (minimum is 5 characters)")
    end

  end

  describe '.authenticate_with_credentials' do
    it 'successfully returns a user hash, when given an existing username and password' do
      @user = User.new(first_name: "James", last_name: "Brown", email: "james@james.com", password: "james", password_confirmation: "james")
      @user.save
      user_lookup = User.authenticate_with_credentials("james@james.com", "james")
      expect(user_lookup).to be_truthy
    end

    it 'successfully authenticates a user who inputs their email with spaces' do
      @user = User.new(first_name: "James", last_name: "Brown", email: "james@james.com", password: "james", password_confirmation: "james")
      @user.save
      user_lookup = User.authenticate_with_credentials("  james@james.com  ", "james")
      expect(user_lookup).to be_truthy
    end

    it 'successfully authenticates a user who inputs their email with the wrong letter case' do
      @user = User.new(first_name: "James", last_name: "Brown", email: "james@james.com", password: "james", password_confirmation: "james")
      @user.save
      user_lookup = User.authenticate_with_credentials("JaMeS@jAmEs.cOm  ", "james")
      expect(user_lookup).to be_truthy
    end
  end

end
