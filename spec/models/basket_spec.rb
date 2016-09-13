require 'rails_helper'

RSpec.describe Basket, type: :model do

  feature "Testing quantity and total method on basket" do
    before do
      @basket = FactoryGirl.create(:basket)
      @product = FactoryGirl.create(:product)
    end

    scenario "The quantity method returns zero if the basket is empty" do
      expect(@basket.quantity).to eq(0)
      expect(@basket.total).to eq(0)
    end

    scenario "One item is added to a basket" do
      @basket.items.create(basket_id: @basket.id, product_id: @product.id, quantity: 1)
      expect(@basket.quantity).to eq(1)
      expect(@basket.total).to eq(@product.price)
    end

    scenario "Three items of the same type are added to a basket" do
      @basket.items.create(basket_id: @basket.id, product_id: @product.id, quantity: 3)
      expect(@basket.quantity).to eq(3)
      expect(@basket.total).to eq(3 * @product.price)
    end

    scenario "Two different products are added to a basket" do
      @product2 = FactoryGirl.create(:product)
      @product2.name = "Cymbidium"
      @basket.items.create(basket_id: @basket.id, product_id: @product.id, quantity: 2)
      @basket.items.create(basket_id: @basket.id, product_id: @product2.id, quantity: 3)
      expect(@basket.quantity).to eq(5)
      expect(@basket.total).to eq(2 * @product.price + 3 * @product2.price)
    end
  end
end
