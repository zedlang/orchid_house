require 'rails_helper'

RSpec.feature "Emptying a basket" do

  before do
    @product = FactoryGirl.create(:product)
    
    @basket = FactoryGirl.create(:basket)
    @order = FactoryGirl.create(:order, basket_id: @basket.id)
    page.set_rack_session(basket_id: @basket.id)
    visit "/products/#{@product.id}"
    click_link "Add to basket"
    visit basket_path
  end

  scenario "Emptying a basket should leave nothing in it" do
    click_link "Empty basket"
    expect(page).to have_no_content(@product.name)
    expect(page).to have_no_content(@product.price)
    expect(@basket.quantity).to eq(0)
  end

end