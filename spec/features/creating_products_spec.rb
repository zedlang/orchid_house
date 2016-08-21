require "rails_helper"

RSpec.feature "Admin users can create new products" do
  let(:admin) { FactoryGirl.create(:user, :admin) }
  before do
    login_as(admin)
    visit "/admin"
    click_link "New Product"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "Cymbidium"
    fill_in "Price", with: 20.95
    fill_in "Quantity", with: 5
    click_button "Create Product"
    expect(page).to have_content "Product has been created."
  end

  scenario "but not when providing invalid attributes" do
    fill_in "Name", with: ""
    fill_in "Price", with: -20.95
    fill_in "Quantity", with: 5.8
    click_button "Create Product"
    expect(page).to have_content "Product has not been created."
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Price must be greater than or equal to 0"
    expect(page).to have_content "Quantity must be an integer"
  end 
end