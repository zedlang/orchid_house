Given(/^they are on the basket page$/) do
  visit basket_path
end

When(/^they go to the order page$/) do
  click_link "Place Order"
end

Then(/^they see details of the order$/) do
  expect(page).to have_content("Total")
  expect(page).to have_css("td#total", text: @order.basket.total.to_s)
end