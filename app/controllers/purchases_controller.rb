class PurchasesController < ApplicationController
  before_action :item_set
  before_action :shop_set

  def done
  end

  def index
  end

  def create
    if current_customer.card.present?
      
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      customer_token = current_customer.card.customer_token
      Payjp::Charge.create(
        amount: @item.price,
        customer: customer_token,
        currency: 'jpy'
      )

      Purchase.create(item_id: params[:item_id], customer_id: current_customer.id)
      redirect_to done_shop_item_purchases_path
    else 
      redirect_to new_card_path
    end
  end

  private

  def item_set
    @item = Item.find(params[:item_id])
  end

  def shop_set
    @shop = Shop.find(params[:shop_id])
  end
end
