class ChannelsController < ApplicationController
  def create
    channel = Channel.new(params.require(:channel).permit(:url))

    if channel.save
      redirect_to channel
    else
      redirect_to root_path, alert: channel.errors.full_messages.join(", ")
    end
  end

  def show
    @channel = Channel.find(params[:channel_id])
  end
end
