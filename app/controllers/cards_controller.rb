class CardsController < ApplicationController
  def new
  end

  def create
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    customer = Payjp::Customer.create(
      description: 'test',
      card: params[:card_token]
    )

    card = Card.new(
      card_token: params[:card_token],
      customer_token: customer.id,
      customer_id: current_customer.id
    )

    if card.save
      redirect_to customer_path(current_customer)
    else
      redirect_to "new"
    end
  end
end
