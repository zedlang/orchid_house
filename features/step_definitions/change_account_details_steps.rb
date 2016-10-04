Given(/^they are viewing their account$/) do
  visit page_show_path
end

When(/^they want to edit their account details$/) do
  click_link "Edit Account Details"
end

Then(/^they are on the edit registration page$/) do
  expect(page).to have_content("Edit User")
end

Then(/^they can change their name$/) do
  fill_in "First name", with: "Rupert"
  fill_in "Last name", with: "Bloggs"
  fill_in "Password", with: "password"
  fill_in "Password confirmation", with: "password"
  fill_in "Current password", with: "password"
  click_button "Update"
  visit page_show_path
  expect(page).to have_content('Bloggs')
  expect(page).to have_content('Rupert')
end

Then(/^they can change their address details$/) do
  fill_in "Address1", with: "Dunroamin"
  fill_in "Postcode", with: "AB1 2CD"
  fill_in "Current password", with: "password"
  click_button "Update"
  visit page_show_path
  expect(page).to have_content("Dunroamin")
  expect(page).to have_content("AB1 2CD")
end

Then(/^they can change their email address$/) do
  fill_in "Email", with: "rupert.bloggs@abc.com"
  fill_in "Current password", with: "password"
  click_button "Update"
  visit page_show_path
  expect(page).to have_content('rupert.bloggs@abc.com')
end