class ItemsController < ApplicationController
  before_action :shop_set
  before_action :item_set, only: [:show, :edit, :update, :destroy]
  before_action :search_item, only: :search

  def new
    @item = Item.new
  end
  
  def create
    @item = @shop.items.new(item_params)
    if @item.save
      redirect_to shop_path(@shop)
    else
      render :new
    end
  end


  def show
    @itemcomment = Itemcomment.new
    @itemcomments = @item.itemcomments.last(10)
  end

  def edit
  end

  def update
    @item = Item.find(params[:id])
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

  def search
    @result_items = @p.result.includes(:itemcategory)
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :itemcategory_id, :shipfrom_id, :shipday_id, :size, :imformation, :price, :image).merge(shopkeeper_id: current_shopkeeper.id, shop_id: current_shopkeeper.shop.id)
  end

  def item_set
    @item = Item.find(params[:id])
  end

  def shop_set
    @shop = Shop.find(params[:shop_id])
  end

  def search_item
    shop = Shop.find(params[:shop_id])
    @p = shop.items.ransack(params[:q])
    @shipday = Shipday.where.not(id: 1)
  end
end
