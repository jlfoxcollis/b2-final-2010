FactoryBot.define do
  factory :player do
    name { Faker::Ancient.hero }
    age { Faker::Number.between(from: 8, to: 18) }
  end
end
