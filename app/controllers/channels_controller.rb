class ChannelsController < ApplicationController
  def index; end

  def new
    @channel = Channel.new
  end

  def create
    @channel = Channel.new(channel_params)
    if @channel.save
      flash[:notice] = t('flash.record_created', record: t('channel.object'))
      redirect_to channels_path
    else
      flash.now[:alert] = t('flash.record_not_created', record: t('channel.object'))
      render "new"
    end
  end

  private

  def channel_params
    params.require(:channel).permit(:name)
  end
end
