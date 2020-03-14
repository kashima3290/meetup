class CommunitiesController < ApplicationController
  before_action :move_to_index, expect: [:index, :show]

  def index 
    @communities = Community.all
  end

  def new
    @community = Community.new
    # @community.users << current_user
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
    if community.save(community_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @community = Community.find(params[:id])
  end

  def chat
  end

  private
  def community_params
    params.require(:community).permit(:name, :image, :text, user_ids: [])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
