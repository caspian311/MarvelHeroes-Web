FactoryGirl.define do
  factory :api_access do
    public_key { Faker::Number.number(10) }
    private_key { Faker::Number.number(10) }
    api_key { Faker::Number.number(10) }
    user
  end
end
