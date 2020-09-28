class ShopsController < ApplicationController
  def show
    @shop = Shop.find(params[:id])
    @items = @shop.items

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

  def edit
    @shop = Shop.find(params[:id])
  end 

  def update

  end
  
  private

  def shop_params
    params.require(:shop).permit(:name, :text, :itemcategory_id, :image).merge(shopkeeper_id: current_shopkeeper.id)
  end

end
