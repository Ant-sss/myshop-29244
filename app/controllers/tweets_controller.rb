class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :destroy]

  def index
    @shop = Shop.find(params[:shop_id])
    @tweets = @shop.tweets.order("created_at DESC")
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

  def show
  end

  def destroy
    if @tweet.destroy
      redirect_to shop_tweets_path(@tweet.shop.id)
    else
      render :show
    end
  end

  private

  def tweet_params
    params.permit(:title, :text, :image).merge(shopkeeper_id: current_shopkeeper.id, shop_id: params[:shop_id])
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

end
