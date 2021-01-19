FactoryBot.define do
  factory :team do
    nickname { Faker::Ancient.hero }
    hometown { Faker::Address.city }
  end
end
