class BoardsController < ApplicationController
  before_action :set_community, only: [:new, :create]
  # before_action :set_part, only: :create

  def index
    @boards = Board.all
    # @parts = Part.all
  end

  def new
    @board = Board.new
    @message = Message.new
    @messages = @community.messages.includes(:user)
    # @parts = Part.all
    # @part = Part.where(community: @community_id)
  end

  def  create
    # @parts = Part.all
    @board = Board.create(board_params)
    if @board.save
      redirect_to community_boards_path
    else
      redirect_to new_community_board_path
    end
  end

  def edit
  end

  def show
  end

  def destroy
  end

  private

  def board_params
    params.permit(:image, :text)
  end

  def set_community
    @community = Community.find(params[:community_id])
  end

  # def set_part
  #   # @part = Part.find(params[:part.id])
  # end

  def part_params
    params.require(:part).permit(:text, :image)
  end
end
