class MessagesController < ApplicationController
  before_action :set_community

  def index
    @message = Message.new
    @messages = @community.messages.includes(:user)
  end

  def create
    @message = @community.messages.new(message_params)
    if @message.save
      redirect_to community_messages_path(@community)
    else
      @messages = @community.messages.includes(:user)
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:text, :image).merge(user_id: current_user.id)
  end

  def set_community
    @community = Community.find(params[:community_id])
  end
end
