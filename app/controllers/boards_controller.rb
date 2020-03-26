class BoardsController < ApplicationController

  def index
    @community = Community.all
  end

  def new
    @board = @community.board.new
    @community = Community.find(params[:community_id])
    # @community = Community.includes(:user)
  end

end
