FactoryBot.define do
  factory :compare do
    sprits { Faker::Lorem.characters(number: 140) }
    posture { Faker::Lorem.characters(number: 140) }
    bamboo { Faker::Lorem.characters(number: 140) }
    position { Faker::Lorem.characters(number: 140) }
    sword { Faker::Lorem.characters(number: 140) }
    zanshin { Faker::Lorem.characters(number: 140) }
    sprits2 { Faker::Lorem.characters(number: 140) }
    posture2 { Faker::Lorem.characters(number: 140) }
    bamboo2 { Faker::Lorem.characters(number: 140) }
    position2 { Faker::Lorem.characters(number: 140) }
    sword2 { Faker::Lorem.characters(number: 140) }
    zanshin2 { Faker::Lorem.characters(number: 140) }
    notice { Faker::Lorem.characters(number: 400) }
    public_id {Faker::Number.between(from: 2, to: 3)}

  end
end