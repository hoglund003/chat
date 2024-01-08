class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to @message.channel
    end
  end

  private

  def message_params
    params.require(:message).permit(:text, :user_id, :channel_id)
  end
end
