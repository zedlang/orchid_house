require "rails_helper"

RSpec.describe MessageMailer, type: :mailer do
  before do
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []
    @message = FactoryGirl.create(:message)
    MessageMailer.contact_email(@message).deliver
  end

  after do
    ActionMailer::Base.deliveries.clear
  end

  it 'should send an email' do
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end

  it 'has a return address' do
    expect(ActionMailer::Base.deliveries.first.from.first).to eq(@message.email)
  end
end
