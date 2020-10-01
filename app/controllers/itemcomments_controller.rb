class ItemcommentsController < ApplicationController
  before_action :item_set

  def index
    @shop = Shop.find(params[:shop_id])
    @itemcomment = Itemcomment.new
    @itemcomments = @item.itemcomments.last(10).includes(:shopkeeper)
  end

  def create
    @shop = Shop.find(params[:shop_id])
    @itemcomment = @item.itemcomments.new(itemcomment_params)
      if @itemcomment.save
        redirect_to shop_item_path(@shop, @item)
      else
        @itemcomments = @item.itemcomments.inclides(:shopkeeper)
        render root_path
      end
  end

  private

  def itemcomment_params
    if shopkeeper_signed_in?
      params.require(:itemcomment).permit(:text).merge(shopkeeper_id: current_shopkeeper.id)
    elsif customer_signed_in?
      params.require(:itemcomment).permit(:text).merge(customer_id: current_customer.id)
    end
  end

  def item_set
    @item = Item.find(params[:item_id])
  end

end
