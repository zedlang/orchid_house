Given(/^they are on the basket page$/) do
  visit basket_path
end

When(/^they are not signed in$/) do
  current_user = nil
end

When(/^they try to place an order$/) do
  click_link "Place Order"
end

Then(/^they are directed to the Sign In page$/) do
  expect(page).to have_content("You need to sign in or sign up before continuing")
  expect(page).to have_content("Log in")
  expect(page).to have_css("form[action='/users/sign_in']")
end

When(/^they go to the order page$/) do
  click_link "Sign in"
  fill_in "Email", with: "customer@orchidhouse.com"
  fill_in "Password", with: "password"
  click_button "Log in"
  visit basket_path
  click_link "Place Order"
end

Then(/^they see details of the order$/) do
  save_and_open_page
  expect(page).to have_content("Order Details")
  expect(page).to have_content("Order No#")
  expect(find(:css, "span#order_no").text).to eq(@order.order_no.to_s)
  expect(page).to have_content("Total")
  expect(page).to have_content("Address for delivery")
  expect(page).to have_content("Email: customer@orchidhouse.com")
  expect(page).to have_css("td#total", text: @order.basket.total.to_s)
end