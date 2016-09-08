require 'rails_helper'

RSpec.describe BasketsController, type: :controller do

  feature "Adding items increases the basket quantity" do
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
end
