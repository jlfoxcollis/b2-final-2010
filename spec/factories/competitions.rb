FactoryBot.define do
  factory :competition do
    name { Faker::Company.name }
    location { Faker::Address.state }
    sport { Faker::Ancient.titan }
  end
end
