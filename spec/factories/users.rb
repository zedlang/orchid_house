FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@orchids.com" }
    password "password"
    first_name "John"
    last_name "Smith"

    trait :admin do
      admin true
      first_name "Admin"
      last_name "User"
    end
  end
end
