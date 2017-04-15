FactoryGirl.define do
  factory :api_access do
    api_key { Faker::Number.number(10) }
    user
  end
end
