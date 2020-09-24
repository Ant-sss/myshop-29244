class HomeController < ApplicationController
  def index
    @shopkeeper = Shopkeeper.new
    @shops = Shop.all.order('created_at DESC')
    @shop = Shop.new
  end
end
