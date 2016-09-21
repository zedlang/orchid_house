require 'rails_helper'

RSpec.feature "Users can view their basket" do

  before do
    @basket = FactoryGirl.create(:basket)
    @pages = [root_path, products_path, page_about_path, page_contact_path, page_faq_path]
    index = rand(6)
    visit @pages[index]
  end

  scenario "A user clicks on the basket icon to view their basket" do

    click_link "View Basket"

    expect(page).to have_content("Product")
    expect(page).to have_content("Quantity")
    expect(page).to have_content("Price")
    expect(page).to have_content("Total")
    
  end

end