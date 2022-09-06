class Public::UsersController < ApplicationController
  def index
  end

  def show
    @user = current_user
    @likes = current_user.likes
  end

  def edit
  end
end
