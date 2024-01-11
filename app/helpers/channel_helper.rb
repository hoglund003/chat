module ChannelHelper
  def notifications_count(user, channel)
    count = channel.unread_notifications.where(user: user).count
    count if count > 0
  end
end
