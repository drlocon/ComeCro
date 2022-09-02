class Public::LikesController < ApplicationController
  def new
    @like = Like.new
  end
  
  def create
    like = Like.new(like_params)
    like.save
    redirect_to index
  end

  def index
  end

  def show
  end

  def edit
  end
  
  private
  
  def like_params
    params.require(:like).permit(:title, :content)
  end
end
