require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    subject {Product.new(name: "Alex",price_cents: 20 , quantity: 10 , category: @category)}
    before do  
      @category = Category.create(name: "abc")
      subject.save
     end   

    it 'is invalid without a name' do
      subject.name = nil     
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Name can't be blank")
    end

    it 'is invalid without a price' do
    subject.price_cents = nil  
    expect(subject).to_not be_valid
    expect(subject.errors.full_messages).to include("Price cents is not a number")
    end

    it 'is invalid without a quantity' do
      subject.quantity = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Quantity can't be blank")
    end 

    it 'is invalid without a category' do
      subject.category = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Category can't be blank")
    end 

  end
end

