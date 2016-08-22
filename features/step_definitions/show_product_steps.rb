When(/^they click on a product's link$/) do
  within("##{@product.id}") do
    click_link "Details"
  end
end

Then(/^they see the product's details$/) do
  expect(page).to have_content("Phaleonopsis")
  expect(@product.price).to eq(9.99)
  expect(@product.quantity).to eq(1)
end