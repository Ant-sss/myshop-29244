class TweetcommentsController < ApplicationController

  def create
    @shop = Shop.find(params[:shop_id])
    @tweet = Tweet.find(params[:tweet_id])
    @tweetcomment = @tweet.tweetcomments.new(params_tweetcomment)
    if @tweetcomment.save
      redirect_to shop_tweet_path(@shop, @tweet)
    else
      render root_path
    end
  end

  private

  def params_tweetcomment
    if shopkeeper_signed_in?
      params.require(:tweetcomment).permit(:text).merge(shopkeeper_id: current_shopkeeper.id)
    elsif customer_signed_in?
      params.require(:tweetcomment).permit(:text).merge(customer_id: current_customer.id)
    end
  end

end
