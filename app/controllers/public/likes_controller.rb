class Public::LikesController < ApplicationController
  before_action :authenticate_user!

  def new
    @like_new = Like.new
  end
  
  def create
    @like_new = Like.new(like_params)
    @like_new.user_id = current_user.id
    tag_list = params[:like][:tag_name].split(",")
    if @like_new.save
      @like_new.save_tags(tag_list)
      redirect_to likes_path
    else
      @like_new = Like.new
      render :new
    end
  end

  def index
    @likes = Like.all
  end

  def show
    @like = Like.find(params[:id])
  end

  def edit
    @like = Like.find(params[:id])
  end
  
  def update
    @like = Like.find(params[:id])
    tag_list = params[:like][:tag_name].split(",")
    if @like.update(like_params)
      @like.save_tags(tag_list)
      redirect_to like_path(params[:id])
    else
      render :edit
    end
  end
  
  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to likes_path
  end
  
  private
  
  def like_params
    params.require(:like).permit(:title, :content, :like_image)
  end
end
