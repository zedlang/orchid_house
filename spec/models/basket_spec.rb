require 'rails_helper'

RSpec.describe Basket, type: :model do

  feature "Testing quantity method on basket" do
    before do
      @basket = FactoryGirl.create(:basket)
      @product = FactoryGirl.create(:product)
    end

    scenario "The quantity method returns zero if the basket is empty" do
      expect(@basket.quantity).to eq(0)
    end

    scenario "One item is added to a basket" do
      @basket.items.create(basket_id: @basket.id, product_id: @product.id, quantity: 1)
      expect(@basket.quantity).to eq(1)
    end

    scenario "Three items of the same type are added to a basket" do
      @basket.items.create(basket_id: @basket.id, product_id: @product.id, quantity: 3)
      expect(@basket.quantity).to eq(3)
    end

    scenario "Two different products are added to a basket" do
      @product2 = FactoryGirl.create(:product)
      @product2.name = "Cymbidium"
      @basket.items.create(basket_id: @basket.id, product_id: @product.id, quantity: 2)
      @basket.items.create(basket_id: @basket.id, product_id: @product2.id, quantity: 3)
      expect(@basket.quantity).to eq(5)
    end
  end
end
