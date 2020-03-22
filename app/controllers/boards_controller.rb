class BoardsController < ApplicationController

  def index
    @boards = Board.all
    @community = Community.all
  end

  def new
    @board = Board.new
    @board.users << current_user
    @community = Community.find(params[:community_id])
  end

  def  create
    @community = Community.find(params[:community_id])
    @board = Board.new(board_params)
    if @board.save
      redirect_to community_boards_path
    else
      render :new
    end
  end

  def edit
    @board = Board.where(params[:community_id])
  end

  def update
    @board = Board.find(params[:id])
    if @board.update(board_params)
      redirect_to community_boards_path
    else
      render :edit
    end
  end

  def destroy
    board = Board.find(params[:id])
    board.destroy
  end

  private

  def board_params
    params.permit(:image, :text, :community_id, user_ids: [])
  end

  def set_community
    @community = Community.find(params[:community_id])
  end

end
