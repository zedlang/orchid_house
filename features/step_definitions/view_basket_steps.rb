Given(/^they are on any page$/) do
  @pages = [root_path, products_path, page_about_path, page_contact_path, page_faq_path]
  index = rand(5)
  visit @pages[index]
end

When(/^they click the Basket link$/) do
  click_link "Basket"
end

Then(/^they see the basket's contents$/) do
  expect(page).to have_content("Product Name")
  expect(page).to have_content("Price")
  expect(page).to have_content("Quantity")
  expect(page).to have_content("Total")
end

Then(/^they see the number of items in the basket$/) do
  save_and_open_page
  expect(page).to have_css("span#quantity")
  expect(find(:css, "span#quantity").text).to eq(@basket.quantity.to_s)
end