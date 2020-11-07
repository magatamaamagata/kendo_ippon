FactoryBot.define do
  factory :comment do
    text { Faker::Lorem.characters(number: 100) }
    association :user
    association :skill
    user_id { 1 }
    skill_id { 2 }
  end
end