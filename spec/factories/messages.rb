FactoryBot.define do
  factory :message do
    text { Faker::Lorem.word }
    user
    channel
  end
end
