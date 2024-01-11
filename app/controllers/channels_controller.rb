class ChannelsController < ApplicationController
  def new
    @channel = Channel.new
  end

  def create
    @channels = Channel.all
    @channel = Channel.new(channel_params)
    if @channel.save
      redirect_to @channel
    else
      flash[:alert] = t('flash.record_not_created', record: t('channel.object'))
      @channel = Channel.first
      # TODO: Refactor to method
      @pagy, @messages = pagy_countless(@channel.messages.order(created_at: :desc), items: 12)
      @messages = @messages.reverse
      render "show", status: :unprocessable_entity
    end
  end

  def show
    @channels = Channel.all
    channel_id = params[:id]
    @channel = channel_id ? Channel.find(channel_id) : Channel.first
    @message = Message.new
    @pagy, @messages = pagy_countless(@channel.messages.order(created_at: :desc), items: 12)
    @messages = @messages.reverse

    render "messages/scroll_list" if params[:page]
  end

  private

  def channel_params
    params.require(:channel).permit(:name)
  end
end
