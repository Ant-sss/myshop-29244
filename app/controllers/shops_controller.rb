class ShopsController < ApplicationController
  def show
    @shop = Shop.find(params[:id])
    @items = Item.all
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :text, :category_id, :image).merge(shopkeeper_id: current_shopkeeper.id)
  end

end
