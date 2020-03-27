class CommunitiesController < ApplicationController
  before_action :move_to_index, expect: [:index, :show]

  def index
    @communities = Community.all.order(created_at: :desc)
  end

  def new
    @community = Community.new
    @community.users << current_user
  end

  def create
    @community = Community.new(community_params)
    if @community.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  def destroy
  end
  
  def edit
    @community = Community.find(params[:id])
  end
  
  def update
    community = Community.find(params[:id])
    if community.update(community_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  
  def show
    @community = Community.find(params[:id])
    @boards = Board.where(community_id: @community.id).order(created_at: :desc)
  end

  private
  def community_params
    params.require(:community).permit(:name, :image, :text, :tag_list, user_ids: [])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
