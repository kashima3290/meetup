class BoardsController < ApplicationController

  def index
    @communitys = Community.all
    @boards = Board.all.order(created_at: :desc)
  end

  def new
    @community = Community.find(params[:community_id])
    @board = @community.boards.new(board_params)
  end

  def show
    @board = Board.find(params[:id])
    @comment = Comment.new
    @comments = @board.comments.includes(:user).order(created_at: :desc)
  end

  def edit
  end
  
  def create
    @community = Community.find(params[:community_id])
    @board = @community.boards.new(board_params)
    if @board.save
      redirect_to boards_path
    else
      render :new
    end
  end

  def search
    @boards = Board.tagged_with(params[:keyword], :wild => true, :any => true) | Board.search(params[:keyword])
  end

  private

  def board_params
    params.permit(:text, :tag_list, :community_id, images: []).merge(user_id: current_user.id)
  end

end
