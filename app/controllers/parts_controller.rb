class PartsController < ApplicationController
  before_action :set_community
  def index
    @parts = @community.parts.includes(:user).order(created_at: :desc)
  end

  def new
    @part = @community.parts.new(part_params)
  end

  def create
    @part = @community.parts.new(part_params)
    if @part.save
      redirect_to community_parts_path(@community)
    else
      render :new
    end
  end

  def destroy
    part = Part.find(params[:id])
    part.destroy
    redirect_to community_parts_path
  end

  private
  def part_params
    params.permit(:schedule, :text, :image, :title).merge(user_id: current_user.id)
  end

  def set_community
    @community = Community.find(params[:community_id])
  end

end
