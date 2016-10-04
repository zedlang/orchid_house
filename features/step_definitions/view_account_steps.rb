Given(/^a user is signed in$/) do
  @user = FactoryGirl.create(:user)
  @address = FactoryGirl.create(:address)
  @user.address_ids = @address.id
  visit root_path
  click_link "Sign in"
  fill_in "Email", with: @user.email
  fill_in "Password", with: "password"
  click_button "Log in"
  expect(page).to have_content "Signed in as #{@user.email}"
end

Then(/^they see a My Account button$/) do
  expect(page).to have_link "My Account"
end

When(/^they click the My Account button$/) do
  click_link "My Account"
end

Then(/^they see their account details$/) do
  expect(page).to have_content("Email")
  expect(page).to have_content("Address1")
  expect(page).to have_content("Postcode")
  expect(page).to have_content("First Name")
  expect(page).to have_content("Last Name")
end