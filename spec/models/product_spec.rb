require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    category = Category.new(name: "Green")
    it "is valid with valid attributes" do      
      product = Product.create(name: "greenbush", quantity: 5, price: 5, category: category  )
      expect(product).to be_valid
    end
    it "is not valid without a name" do
      product = Product.create(name: nil, quantity: 5, price: 5, category: category  )
      expect(product.errors.full_messages).to_not be_empty
    end
    it "is not valid without a quantity" do
      product = Product.create(name: "noquant", quantity: nil, price: 5, category: category  )
      expect(product.errors.full_messages).to_not be_empty
    end
    it "is not valid without a price" do
      category = Category.new(name: "Green")
      product = Product.create(name: "noprice", quantity: 5, price: "", category: category  )
      expect(product.errors.full_messages).to_not be_empty
    end
    it "is not valid without a category" do
      product = Product.create(name: "nocate", quantity: 5, price: 5, category: nil  )
      expect(product.errors.full_messages).to_not be_empty
    end
  end
end