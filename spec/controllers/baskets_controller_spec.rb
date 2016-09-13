require 'rails_helper'

RSpec.describe BasketsController, type: :controller do

  feature "Adding items" do
    before do
      @basket = FactoryGirl.create(:basket)
      @product = FactoryGirl.create(:product)
      session[:basket_id] = @basket.id
    end

    scenario "Adding an item increases the basket quantity by one" do
      original_quantity = @basket.quantity
      put :add, product_id: @product.id

      @basket = Basket.find(session[:basket_id])
      expect(@basket.quantity).to eq(original_quantity + 1)
      expect(response).to redirect_to basket_path
    end
  end

  feature "Removing items" do
    before do
      @basket = FactoryGirl.create(:basket)
      @product = FactoryGirl.create(:product)
      session[:basket_id] = @basket.id
    end

    scenario "Removing an item decreases the basket quantity by one" do
      put :add, product_id: @product.id
      original_quantity = @basket.quantity
      put :remove, product_id: @product.id

      @basket = Basket.find(session[:basket_id])
      expect(@basket.quantity).to eq(original_quantity - 1)
      expect(response).to redirect_to basket_path
    end

    scenario "If the quantity of one product is zero, the product is removed" do
      @basket = Basket.find(session[:basket_id])
      an_item = @basket.items.find_by(product_id: @product.id)
      put :remove, product_id: @product.id
      expect(an_item).to be_nil
    end
  end
end
