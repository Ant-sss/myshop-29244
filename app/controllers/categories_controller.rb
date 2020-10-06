class CategoriesController < ApplicationController
  before_action :search_shop
  before_action :search_item

  def index
    @result_items = @p.result.includes(:itemcategory)
    @result_shops = @a.result.includes(:itemcategory)
  end

  def search
  end

  private

  def search_shop
    @a = Shop.ransack(params[:q])
  end

  def search_item
    @p = Item.ransack(params[:q])
    @itemcategory_parent_id = Itemcategory.where(ancestry: nil)
    @itemcategory_accessories_id = Itemcategory.find(1).children
    @itemcategory_clothes_id = Itemcategory.find(17).children
    @itemcategory_goods_id = Itemcategory.find(27).children
    @itemcategory_furnitures_id = Itemcategory.find(38).children
    @itemcategory_foods_id = Itemcategory.find(49).children
    @itemcategory_pictures_id = Itemcategory.find(55).children
    @itemcategory_paintings_id = Itemcategory.find(60).children
  end


end
