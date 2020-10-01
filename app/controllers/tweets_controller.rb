class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :destroy]
  before_action :set_shop

  def index
    @tweets = @shop.tweets.order("created_at DESC")
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = @shop.tweets.new(tweet_params)
    if @tweet.save
      redirect_to shop_tweets_path(@shop)
    else
      render "new"
    end
  end

  def show
  end

  def destroy
    if @tweet.destroy
      redirect_to shop_tweets_path(@tweet.shop.id)
    else
      render :index
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:title, :text, :image).merge(shopkeeper_id: current_shopkeeper.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def set_shop
    @shop = Shop.find(params[:shop_id])
  end

end
