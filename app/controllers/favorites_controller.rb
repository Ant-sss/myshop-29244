class FavoritesController < ApplicationController

  def create
    favorite = current_customer.favorites.new(params_favorite)
    if favorite.save
      redirect_to shop_path(params[:shop_id])
    else
      redirect_to root_path
    end
  end

  def destroy
    if  current_customer.favorites.find_by(shop_id: params[:shop_id]).destroy
      redirect_to shop_path(params[:shop_id])
    else
      redirect_to root_path
    end
  end

  private

  def params_favorite
    params.permit(:shop_id).merge(customer_id: current_customer.id)
  end


end
