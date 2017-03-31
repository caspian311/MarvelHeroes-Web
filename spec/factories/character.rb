FactoryGirl.define do
  factory :character do
    character_id Random.new.rand(1000000).to_s
    body '{ "data": { "results": [ { "id": "character_id", "name": "Super Hero" } ] } }'
  end
end


