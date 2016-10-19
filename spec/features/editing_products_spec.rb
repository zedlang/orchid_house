require "rails_helper"

RSpec.feature "Admins can edit a product's details" do
  let(:admin) { FactoryGirl.create(:user, :admin) }
  product1 = FactoryGirl.create(:product) 
  product2 = FactoryGirl.create(:product)
  product1.name = "Vanda"
  @products = [product1, product2]
  before do
    login_as(admin)
    visit "/admin"
    click_link "Show all products"
    
    within("##{product1.name}") do
      click_link "Details"
    end
  end

  scenario "An admin clicks Edit Product and updates an existing product" do
    
    #The Happy Path!
    click_link "Edit Product"
    fill_in "Price", with: 10.99
    fill_in "Quantity", with: 4
    click_on "Update Product"
    expect(page).to have_content(10.99)
    expect(page).to have_content(4)
    expect(page).to have_content("Product has been updated")
  end

  scenario "An admin clicks Edit Product and updates an existing product with bad data" do

    #The Path of Sorrow!
    click_link "Edit Product"
    fill_in "Price", with: -10.99
    click_on "Update Product"
    expect(page).to have_content("Product has not been updated")
  end
end