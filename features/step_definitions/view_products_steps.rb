Given(/^products exist$/) do
  @product = FactoryGirl.create(:product)
end

When(/^they visit the products page$/) do
  visit products_path
end

Then(/^they see a list of products$/) do
  expect(page).to have_content("Products")
  expect(@product.name).to eq("Phaleonopsis")
end