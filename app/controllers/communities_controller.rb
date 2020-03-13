class CommunitiesController < ApplicationController
  before_action :move_to_index, expect: [:index, :show]

  def index 
    @communities = Community.all
  end

  def new
    @community = Community.new
  end

  def create
    Community.create(community_params)
  end

  def destroy
  end

  def edit
    @community = Community.find(params[:id])
  end

  def update
    community = Community.find(params[:id])
    community.update(community_params)
  end

  def show
    @community = Community.find(params[:id])
  end

  private
  def community_params
    params.require(:community).permit(:name, :image, :text).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
