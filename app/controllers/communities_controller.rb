class CommunitiesController < ApplicationController

  def index 
    @communities = Community.all
  end

  def new
    @community = Community.new
  end

end
