FactoryBot.define do
  factory :skill do
    youtube_id {Faker::Number.between(from: 2, to: 5)}
    association :user

    after(:build) do |skill|
      skill.video.attach(io: File.open('public/video/video.MOV'), filename: 'video.MOV')
    end
  end
end
