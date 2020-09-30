class ItemsController < ApplicationController
  before_action :item_set, only: [:show, :edit, :update, :destroy]

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    # binding.pry
    if @item.save
      redirect_to shop_path(@item.shop.id)
    else
      render "new"
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @shop = Shop.find(params[:shop_id])
  end

  def update
    if @item.update(item_params)
      redirect_to shop_path(@item.shop.id)
    else 
      render "edit"
    end
  end

  def destroy
    if @item.destroy
      redirect_to shop_path(@item.shop.id)
    else
      render "edit"
    end
  end

  private

  def item_params
    params.permit(:name, :text, :itemcategory_id, :shipfrom_id, :shipday_id, :size, :imformation, :price, :image).merge(shopkeeper_id: current_shopkeeper.id, shop_id: current_shopkeeper.shop.id)
  end

  def item_set
    @item = Item.find(params[:id])
  end

end
