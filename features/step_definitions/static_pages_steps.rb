Given(/^they are on a random app page$/) do
  @pages = [root_path, products_path, page_about_path, page_contact_path, page_faq_path]
  index = rand(6)
  visit @pages[index]
end

When(/^they click on the Home link$/) do
  click_link "Home"
end

Then(/^they are taken to the home page$/) do
  expect(page).to have_content("House of Orchids")
  expect(page).to have_css("section#home")
end

When(/^they click on the About link$/) do
  click_link "About"
end

Then(/^they are taken to the About page$/) do
  expect(page).to have_content("About Us")
  expect(page).to have_css("section#about")
end

When(/^they click on the Contact Us link$/) do
  click_link "Contact Us"
end

Then(/^they are taken to the Contact Us page$/) do
  expect(page).to have_content("Contact Us")
  expect(page).to have_css("section#contact")
end

When(/^they click on the FAQ link$/) do
  click_link "FAQ"
end

Then(/^they are taken to the FAQ page$/) do
  expect(page).to have_content("Frequently Asked Questions")
  expect(page).to have_css("section#faq")
end