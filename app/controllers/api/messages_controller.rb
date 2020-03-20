class Api::MessagesController < ApplicationController
  def index
    community = Community.find(params[:community_id])
    last_message_id = params[:id].to_i
    @messages = community.messages.includes(:user).where("id > ?", last_message_id)
  end
end