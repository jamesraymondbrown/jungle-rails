require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do
    it 'should validate that the user has a name' do
      @user = User.new(email: 'james@james.com')
      @user.save

      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

  end

end
