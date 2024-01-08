
User.destroy_all
Channel.destroy_all

30.times do
  nickname = Faker::Internet.username
  user = User.new(
    nickname: nickname,
    email: Faker::Internet.email(name: nickname),
    password: "password",
    password_confirmation: "password",
    )
  puts "User created!" if user.save!
end

channel_names = %w[general specific announcements news random]

channel_names.each do |channel_name|
  channel = Channel.new(
    name: channel_name
  )

  puts "Channel created!" if channel.save!
end