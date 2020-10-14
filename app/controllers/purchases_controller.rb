class PurchasesController < ApplicationController
  before_action :item_set
  before_action :shop_set

  def done
  end

  def index
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    card = Card.find_by(customer_id: current_customer.id)

    redirect_to new_card_path and return unless card.present?

    customer = Payjp::Customer.retrieve(card.customer_token)
    @card = customer.cards.first
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

      @item.decrement(:stock, 1)
      @item.save
      
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
