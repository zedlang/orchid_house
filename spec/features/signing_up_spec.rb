require "rails_helper"
require "database_cleaner"

RSpec.feature "Users can sign up" do
  before do
    visit "/"
    click_link "Sign up"
    fill_in "Email", with: "zed@zed.com"
    fill_in "user_password", with: "password"
    fill_in "Password confirmation", with: "password"
  end
  scenario "when providing valid details" do
    fill_in "First name", with: "John"
    fill_in "Last name", with: "Smith"
    fill_in "Address1", with: "The Orchid House"
    fill_in "Address2", with: "7 Acacia Avenue"
    fill_in "City", with: "Cambridge"
    fill_in "Postcode", with: "CB1 1AB"
    click_button "Sign up"
    expect(page).to have_content("You have signed up successfully.")
  end

  scenario "when providing blank names" do
    fill_in "First name", with: ""
    fill_in "Last name", with: ""
    click_button "Sign up"
    expect(page).to have_content("First name can't be blank")
    expect(page).to have_content("Last name can't be blank")
  end

  scenario "when providing names with odd characters" do
    fill_in "First name", with: "James3"
    fill_in "Last name", with: "Jones" 
    click_button "Sign up"
    expect(page).to have_content("This field can only contain the letters A-Z or a-z")
    fill_in "First name", with: "James"
    fill_in "Last name", with: "Jon@s" 
    expect(page).to have_content("This field can only contain the letters A-Z or a-z")
  end
end
