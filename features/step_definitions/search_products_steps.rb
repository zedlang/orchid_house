When(/^they enter a value into the Search field$/) do
  fill_in "query", with: "Phaleonopsis"
  click_button "Search"
end

Then(/^they see a list of products matching the search criteria$/) do
  expect(page).to have_content("Search Results")
  expect(page).to have_content("Phaleonopsis")
end

When(/^they enter a non\-existent value into the Search field$/) do
  fill_in "query", with: "xxxxx"
  click_button "Search"
end

Then(/^they see no results$/) do
  expect(page).to have_content("Search Results")
  expect(page).to have_content("No search results matched your query")
  expect(page).to have_no_content("Phaleonopsis")
end