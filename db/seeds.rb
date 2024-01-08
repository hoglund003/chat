
User.destroy_all


30.times do
  nickname = Faker::Internet.username
  user = User.new(
    nickname: nickname,
    email: Faker::Internet.email(name: nickname),
    password: "password",
    password_confirmation: "password",
    )
  puts "User created!" if user.save
end
