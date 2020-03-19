class PartsController < ApplicationController
  before_action :set_community


  def index
    @part = Part.new
    @parts = Part.all
    # @parts = @community.parts.include(:user)
  end

  def create
    @part = @community.parts.new(part_params)
    if @part.save
      redirect_to community_parts_path(@community)
    else
      render :index
    end
  end

  private
  def part_params
    params.require(:part).permit(:text, :image).merge(user_id: current_user.id)
  end

  def set_community
    @community = Community.find(params[:community_id])
  end

end
