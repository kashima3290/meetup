class Communities::SearchesController < ApplicationController
  def index
    @communities = Community.search(params[:keyword]).order(created_at: :desc)
  end
end
