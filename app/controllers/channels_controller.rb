class ChannelsController < ApplicationController
  def index
    @channels = Channel.all.order(name: :asc)
    if turbo_frame_request?
      render partial: "channels/list", locals: {channels: @channels}
    end
  end

  def new
    @channel = Channel.new
  end

  def create
    @channel = Channel.new(channel_params)
    if @channel.save
      flash[:notice] = t('flash.record_created', record: t('channel.object'))
      redirect_to @channel
    else
      flash.now[:alert] = t('flash.record_not_created', record: t('channel.object'))
      render "new"
    end
  end

  def show
    @channel = Channel.find(params[:id])
    @channels = Channel.all
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
