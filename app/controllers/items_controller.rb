class ItemsController < ApplicationController
  def new
    @item = Item.new
    @itemcategory_parent = Itemcategory.where(ancestry: nil)
    @accesories = Category.where(category_id: 1)
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

  private

  def item_params
    params.permit(:name, :text, :itemcategory_id, :shipfrom_id, :price, :image).merge(shopkeeper_id: current_shopkeeper.id, shop_id: current_shopkeeper.shop.id)
  end

end
