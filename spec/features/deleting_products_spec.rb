require "rails_helper"

RSpec.feature "Admins can delete a product" do
  let(:admin) { FactoryGirl.create(:user, :admin) }
  product1 = FactoryGirl.create(:product) 
  product2 = FactoryGirl.create(:product)
  product2.name = "Cymbidium"
  @products = [product1, product2]
  before do
    login_as(admin)
    visit "/admin"
    click_link "Show all products"
    
    within("##{product2.name}") do
      click_link "Details"
    end
  end

  scenario "An admin clicks Delete Product and removes an existing product" do

    click_link "Delete Product"
    expect(page).to have_content "Product has been deleted"
    expect(page.current_path).to eq products_path
    expect(page).to have_no_content "Cymbidium"
  end
end