class ShopsController < ApplicationController
  before_action :shop_set, only: [:show, :edit, :update, :destroy]

  def show
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
  
  private

  def shop_params
    params.require(:shop).permit(:name, :text, :itemcategory_id, :image).merge(shopkeeper_id: current_shopkeeper.id)
  end

  def shop_set
    @shop = Shop.find(params[:id])
  end
end
