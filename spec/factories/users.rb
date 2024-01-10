FactoryBot.define do
  factory :user do
    nickname { Faker::Internet.username }
    email { Faker::Internet.email(name: nickname) }
    password { "password" }
    password_confirmation { "password" }
  end
end
