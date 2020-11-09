FactoryBot.define do
  factory :comment do
    text { Faker::Lorem.characters(number: 100) }
    association :user
    association :skill
  end
end