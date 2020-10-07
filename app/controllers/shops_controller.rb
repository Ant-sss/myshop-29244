class ShopsController < ApplicationController
  before_action :shop_set, only: [:show, :edit, :update, :destroy]
  before_action :search_shop, only: [:index, :search]
  before_action :search_item, only: :show

  def index
    @shops = Shop.all
  end

  def show
    @items = @shop.items
    @favorite = current_customer.favorites.find_by(shop_id: params[:id])
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
  end 

  def update
    if @shop.update(shop_params)
      redirect_to shop_path(@shop)
    else
      render "edit"
    end
  end

  def destroy
    if @shop.destroy
      redirect_to root_path
    else
      render "edit"
    end
  end

  def search
    @result_shops = @a.result.includes(:itemcategory)
  end
  
  private

  def shop_params
    params.require(:shop).permit(:name, :text, :itemcategory_id, :image).merge(shopkeeper_id: current_shopkeeper.id)
  end

  def shop_set
    @shop = Shop.find(params[:id])
  end

  def search_shop
    @a = Shop.ransack(params[:q])
    @itemcategory_parent_id = Itemcategory.where(ancestry: nil)
  end

  def search_item
    shop = Shop.find(params[:id])
    @p = shop.items.ransack(params[:q])
    @shipday = Shipday.where.not(id: 1)
  end
end
