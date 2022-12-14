class Public::UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @likes = @user.likes
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
  
  def confirm
  end
  
  def withdrawal
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :profile, :profile_image)
  end
end
