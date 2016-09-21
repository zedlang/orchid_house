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
  expect(page).to have_css("#quantity")
  expect(find(:css, "span#quantity").text).to eq("0")
  visit products_path
  within(find(:css, "li#2")) do
      click_link "Details"
  end
  click_link "Add to basket"
  expect(find(:css, "span#quantity").text).to eq("1")
end