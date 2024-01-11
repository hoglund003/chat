class MessagesController < ApplicationController
  def create
    @message = current_user.messages.new(message_params)
    @channel = @message.channel
    respond_to do |format|
      if @message.save
        set_notifications

        @message = Message.new
        format.turbo_stream {
          render turbo_stream: turbo_stream.replace(
            "message_form",
            partial: "messages/form",
            locals: { message: @message, channel: @channel }
          )
        }
      end
    end
  end

  def set_notifications
    all_users_except_current = User.where.not(id: current_user.id)
    all_users_except_current.each { |user| UnreadNotification.create(user: user, message: @message) }
  end

  private

  def message_params
    params.require(:message).permit(:text, :channel_id)
  end
end
