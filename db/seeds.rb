
Message.destroy_all
User.destroy_all
Channel.destroy_all
UnreadNotification.destroy_all

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

Channel.all.each do |channel|
  100.times do
    date = rand((4.months.ago)..(0.days.ago))
    user = User.all.sample
    message = Message.new(
      text: Faker::Lorem.sentence(word_count: 3),
      channel: channel,
      user: user,
      created_at: date,
    )
    puts "Message created!" if message.save!

    User.where.not(id: user.id).each do |user|
      notification = UnreadNotification.new(user: user, message: message)
      puts "Notification created!" if notification.save!
    end
  end
end