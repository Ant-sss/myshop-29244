class TweetsController < ApplicationController

  def index
    @shop = Shop.find(params[:shop_id])
    @tweets = @shop.tweets
  end

end
