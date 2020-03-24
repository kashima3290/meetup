class Communities::SearchesController < ApplicationController
  def index
    @communities = Community.tagged_with(params[:keyword], :wild => true, :any => true) | Community.search(params[:keyword])
  end
end
