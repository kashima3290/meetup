class BoardsController < ApplicationController

  def index
    @community = Community.all
  end

  def new
    @board = Board.new
    @community = Community.includes(:user)
  end

end
