require 'rails_helper'

RSpec.feature "A user can submit a contact form" do

  before do
    visit page_contact_path
    click_link "Send us a message!"   
  end

  scenario "A user enters valid information" do
    fill_in 'Name', :with => 'Joe Bloggs'
    fill_in 'Email', :with => 'joe@bloggs.com'
    fill_in 'Subject', :with => 'Do you have Brassia orchids?'
    fill_in 'Message', :with => 'I am interested in Brassia orchids. Do you have any?'
    click_button 'Submit Message'
    expect(page).to have_content('Thank you for your message')
  end

  scenario "A user enters invalid information" do
    fill_in 'Name', :with => ''
    fill_in 'Email', :with => ''
    fill_in 'Subject', :with => 'Do you have Brassia orchids?'
    fill_in 'Message', :with => 'I am interested in Brassia orchids. Do you have any?'
    click_button 'Submit Message'
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Email can't be blank")
  end  

end