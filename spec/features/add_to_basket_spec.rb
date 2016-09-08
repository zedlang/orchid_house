require 'rails_helper'

RSpec.feature "Users can add items to a basket" do

  before do
    @product = FactoryGirl.create(:product)
    @basket = FactoryGirl.create(:basket)
    visit "/products/#{@product.id}"
  end  

  scenario "User adds an item" do
    click_link "Add to basket"
    expect(page).to have_content(@product.name)
    expect(page).to have_content(@product.name, count: 1)
    expect(page).to have_content(@product.price, count: 1)
  end

  scenario "User adds more than ome of the same item" do
    click_link "Add to basket"
    visit "/products/#{@product.id}"
    click_link "Add to basket"
    expect(page).to have_content(@product.name, count: 1)
    expect(page).to have_content(@product.price, count: 1)
  end

end