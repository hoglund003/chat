module ChannelHelper
  def notifications_count(user, channel)
    channel.unread_notifications.where(user: user).count
  end
end
