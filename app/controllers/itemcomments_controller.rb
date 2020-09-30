class ItemcommentsController < ApplicationController

  def new
    @itemcomments = Itemcomment.all
    @itemcomment = Itemcomment.new
  end

  def create
    @itemcomment = Itemcomment.new(itemcomment_params)
  end

  private

  def itemcomment_params
    params.permit(:itemcomment).require(:text).merge(shopkeeper_id: current_shopkeeper.id, customer_id: current_customer.id, item_id: params[:item_id])
  end
end
