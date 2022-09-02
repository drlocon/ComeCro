class Public::LikesController < ApplicationController
  def new
    @like_new = Like.new
  end
  
  def create
    @like_new = Like.new(like_params)
    @like_new.user_id = current_user.id
    if @like_new.save
      redirect_to like_path
    else
      @like_new = Like.new
      render :new
    end
  end

  def index
    @likes = Like.all
  end

  def show
  end

  def edit
  end
  
  private
  
  def like_params
    params.require(:like).permit(:title, :contentm, :like_image)
  end
end
