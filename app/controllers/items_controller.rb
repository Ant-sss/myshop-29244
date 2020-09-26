class ItemsController < ApplicationController
  def new
    @item = Item.new
    @item_category_parent = Itemcategory.where(ancestry: nil)
  end

  def get_category_children
    @item_category_children = Itemcategory.find("#{params[:parent_id]}").child
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to 'shops/show'
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :shipfrom_id, :price).merge(shopkeeper_id: current_shopkeeper.id)
  end
end
