class TweetsController < ApplicationController

  def index
    @shop = Shop.find(params[:shop_id])
    @tweets = @shop.tweets
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to shop_tweets_path(@tweet.shop.id)
    else
      render "new"
    end
  end

  private

  def tweet_params
    params.permit(:title, :text, :image).merge(shopkeeper_id: current_shopkeeper.id, shop_id: params[:shop_id])
  end

end
