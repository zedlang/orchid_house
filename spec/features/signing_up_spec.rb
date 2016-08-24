require "rails_helper"
require "database_cleaner"

RSpec.feature "Users can sign up" do
  scenario "when providing valid details" do
    visit "/"
    click_link "Sign up"
    fill_in "First name", with: "John"
    fill_in "Last name", with: "Smith"
    fill_in "Email", with: "zed@zed.com"
    fill_in "user_password", with: "password"
    fill_in "Password confirmation", with: "password"
    fill_in "Address1", with: "The Orchid House"
    fill_in "Address2", with: "7 Acacia Avenue"
    fill_in "City", with: "Cambridge"
    fill_in "Postcode", with: "CB1 1AB"
    click_button "Sign up"
    expect(page).to have_content("You have signed up successfully.")
  end
end
