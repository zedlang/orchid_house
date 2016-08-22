require "rails_helper"

RSpec.feature "Users can only see the appropriate links" do
  let(:user) { FactoryGirl.create(:user) }
  let(:admin) { FactoryGirl.create(:user, :admin) }
  product = FactoryGirl.create(:product)

  context "Anonymous users" do
    scenario "cannot see the Edit Product link" do
      visit product_path(product)
      expect(page).not_to have_link "Edit Product"
    end

    scenario "cannot see the Delete Product link" do
      visit product_path(product)
      expect(page).not_to have_link "Delete Product"
    end
  end
          
  context "Regular users" do
    before { login_as(user) }
    scenario "cannot see the Edit Product link" do
      visit product_path(product)
      expect(page).not_to have_link "Edit Product"
    end

    scenario "cannot see the Delete Product link" do
      visit product_path(product)
      expect(page).not_to have_link "Delete Product"
    end
  end
  
  context "Admin users" do
    before { login_as(admin) }
    scenario "can see the Edit Product link" do
      visit product_path(product)
      expect(page).to have_link "Edit Product"
    end

    scenario "can see the Delete Product link" do
      visit product_path(product)
      expect(page).to have_link "Delete Product"
    end
  end
end