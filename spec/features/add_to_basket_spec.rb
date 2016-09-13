require 'rails_helper'

RSpec.feature "Users can add items to a basket" do

  before do
    @product = FactoryGirl.create(:product)
    @product2 = FactoryGirl.create(:product, name: "Dendrobium", price: 12.99)
    @basket = FactoryGirl.create(:basket)
    @basket.items.create(basket_id: @basket.id, product_id: @product.id, quantity: 1)
    visit "/products/#{@product.id}"
  end  

  scenario "User adds an item" do
    click_link "Add to basket"
    
    expect(page).to have_content(@product.name)
    expect(page).to have_content(@product.name, count: 1)
    expect(page).to have_content(@product.price, count: 2)
    expect(page).to have_content(@basket.total)
  end

  scenario "User adds more than one of the same item" do
    #Test that adding more than one item does not just add
    #it to the list at the end

    @basket.items.update(basket_id: @basket.id, product_id: @product.id, quantity: 2)
    click_link "Add to basket"
    visit "/products/#{@product.id}"
    click_link "Add to basket"

    expect(page).to have_content(@product.name, count: 1)
    expect(page).to have_content(@product.price * 2, count: 2)
    expect(page).to have_content(@basket.total)
  end

  scenario "User adds several different items" do
    @basket.items.create(basket_id: @basket.id, product_id: @product2.id, quantity: 1)
    click_link "Add to basket"
    visit "/products/#{@product2.id}"
    click_link "Add to basket"

    expect(page).to have_content(@product.name, count: 1)
    expect(page).to have_content(@product2.name, count: 1)
    expect(page).to have_content(@product.price, count: 1)
    expect(page).to have_content(@product2.price, count: 1)
    expect(page).to have_content(@basket.total)
  end

end