class ApplicationController < ActionController::Base
  before_action :configure_premitted_parameters, if: :devise_controller?
  before_action :basic_auth
  before_action :search_shop
  before_action :search_item

  def search
    @result_shops = @a.result.includes(:itemcategory)
    @result_items = @p.result.includes(:itemcategory)
    # binding.pry
  end

  protected

  def configure_premitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :first_name, :phone_num, :birthday, :nickname])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def search_shop
    @a = Shop.ransack(params[:q])
    @itemcategory_parent_id = Itemcategory.where(ancestry: nil)
  end

  def search_item
    @p = Item.ransack(params[:q])
    @shipday = Shipday.where.not(id: 1)
  end


end

