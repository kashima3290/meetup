class BoardsController < ApplicationController
  before_action :set_board
  before_action :set_community

  def index
    @boards = Board.includes(:community)
  end

  def new
    @board = Board.new
    @message = Message.new
    @messages = @board.messages.includes(:user)
  end

  def create
    @board = Board.new(board_params)
    if @community.save
      redirect_to community_boards_path
    else
      render :new
    end

    @message = @board.messages.new(message_params)
    if @message.save
      redirect_to community_messages_path(@community)
    else
      @messages = @community.messages.includes(:user)
      render :new
    end
  end

  def show
  end

  def destroy
  end

  private
  def board_params
    params.require(:board).permit(:image, :text, user_ids: [])
  end

  def message_params
    params.require(:message).permit(:text, :image).merge(user_id: current_user.id)
  end

  def set_board
    # @board = Board.find(params[:board_id])
  end

  def set_community
    @community = Community.find(params[:community_id])
  end
end
