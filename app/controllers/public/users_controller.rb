class Public::UsersController < ApplicationController
  def index
  end

  def show
    @user = current_user
    @likes = current_user.likes
  end

  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :profile, :profile_image)
  end
end
