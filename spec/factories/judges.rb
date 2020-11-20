FactoryBot.define do
  factory :judge do
    judge_correct_id { Faker::Number.between(from: 2, to: 3) }
    association :user
    association :post
  end
end
