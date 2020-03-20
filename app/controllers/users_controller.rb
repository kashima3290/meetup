class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    if current_user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  def show
  end

  private 
  def user_params
    params.require(:user).permit(:image, :name, :age, :email)
  end

end
