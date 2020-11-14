FactoryBot.define do
  factory :compare do
    keep { Faker::Lorem.characters(number: 400) }
    problem { Faker::Lorem.characters(number: 400) }
    make_better { Faker::Lorem.characters(number: 400) }
    notice { Faker::Lorem.characters(number: 400) }
    public_id {Faker::Number.between(from: 2, to: 3)}

  end
end