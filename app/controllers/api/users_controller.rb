class Api::UsersController < ApplicationController
  def index
    return nil if params[:keyword] == ""
      @users = User.where(['name LIKE ?', "%#{params[:keyword]}%"] ).where.not(id: current_user.id).limit(10)
    respond_to do |format|
    format.html
    format.json
    end
  end

  def show
    user = User.find(params[:id])
    #  user.sign_in_count.zero?
    #   redirect root_path
    # end
  end
end
