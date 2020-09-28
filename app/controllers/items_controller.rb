class ItemsController < ApplicationController
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    # binding.pry
    if @item.save
      redirect_to shop_path(@item.shop.id)
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
  end

  private

  def item_params
    params.permit(:name, :text, :itemcategory_id, :shipfrom_id, :price, :image).merge(shopkeeper_id: current_shopkeeper.id, shop_id: current_shopkeeper.shop.id)
  end

end
