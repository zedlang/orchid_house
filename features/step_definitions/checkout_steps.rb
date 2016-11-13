Given(/^they are on the order page$/) do
  visit basket_path
  click_link "Sign in"
  fill_in "Email", with: "customer@orchidhouse.com"
  fill_in "Password", with: "password"
  click_button "Log in"
  visit basket_path
  click_link "Place Order"
end

When(/^they go to the checkout page$/) do
  click_on "Pay for goods"
end

Then(/^they see details of how to pay$/) do
  expect(page).to have_content("Total to pay: £#{@basket.total}")
end