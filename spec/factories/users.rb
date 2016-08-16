FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@orchids.com" }
    password "password"
  end
end
