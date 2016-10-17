Given(/^they are on the order page$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^they go to the checkout page$/) do
  click_on "Go To Checkout"
end

Then(/^they see details of how to pay$/) do
  expect(page).to have_content("Total to pay: £@total")
  expect(page).to have_content("Shipping Address")
end