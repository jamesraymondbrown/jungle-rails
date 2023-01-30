require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should create a product with all four mandatory fields present' do
      @category = Category.new(name: 'literature')
      @category.save!
      @product = @category.products.create(name: 'book', price: 2000, quantity: 9)
      @product.save!

      expect(@product.name).to be_present
      expect(@product.price).to be_present
      expect(@product.quantity).to be_present
      expect(@product.category).to be_present
    end

  end
end
