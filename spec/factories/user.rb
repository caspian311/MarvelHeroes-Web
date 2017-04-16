FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Lorem.word }

    factory :user_with_api_key do
      association :api_access, factory: :api_access, strategy: :build
    end
  end
end
