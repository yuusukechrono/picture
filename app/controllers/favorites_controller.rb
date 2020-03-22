class FavoritesController < ApplicationController
  def new
  end

  def create
    @picture = params[:picture_id]
    @user_id = current_user.id
    @favorite = Favorite.new(user_id: @user_id, picture_id: @picture)
    @favorite.save!
    redirect_to pictures_path, notice: "お気に入り登録しました"

  end
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to pictures_path, notice: "お気に入り解除しました"
  end
end
