class FavoritesController < ApplicationController
  def create
    @fukyo_favorite = Favorite.new(user_id: current_user.id, fukyo_id: params[:fukyo_id])
    @fukyo_favorite.save
    redirect_to fukyo_path(params[:fukyo_id]) 
  end

  def destroy
    @fukyo_favorite = Favorite.find_by(user_id: current_user.id, fukyo_id: params[:fukyo_id])
    @fukyo_favorite.destroy
    redirect_to fukyo_path(params[:fukyo_id]) 
  end
end
