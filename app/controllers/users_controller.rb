class UsersController < ApplicationController

  def index
    @communities = current_user.communities.order(created_at: :desc)
    # communities = Community.includes(:user).order(created_at: :desc)
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private 
  def user_params
    params.require(:user).permit(:image, :name, :age, :email, :text, :gender)
  end

end
