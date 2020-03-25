class BoardsController < ApplicationController

  def index
    @community = Community.find(params[:community_id])
  end

  def new
  end

end
