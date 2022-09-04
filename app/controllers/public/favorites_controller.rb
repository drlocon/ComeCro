class Public::FavoritesController < ApplicationController
  def create
    like = Like.find(params[:like_id])
    @favorite = current_user.favorites.new(like_id: like.id)
    @favorite.save
    render "replace_btn"
  end

  def destroy
    like = Like.find(params[:like_id])
    @favorite = current_user.favorites.find_by(like_id: like.id)
    @favorite.destroy
    render "replace_btn"
  end
end
