FactoryBot.define do
  factory :post do
    gif_url {"https://gyazo.com/42fd33c204dcd947f5c22636799416e2"}
    judge_correct_id {Faker::Number.between(from: 2, to: 3)}
    difficulity_id {Faker::Number.between(from: 2, to: 5)}
    description { Faker::Lorem.characters(number: 400) }
    association :user

    after(:build) do |post|
      post.video.attach(io: File.open('public/video/video.MOV'), filename: 'video.MOV')
    end
  end
end