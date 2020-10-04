class ApplicationController < ActionController::Base
  before_action :configure_premitted_parameters, if: :devise_controller?
  before_action :basic_auth
  before_action :search_shop

  def search
    @result_items = @p.result.includes(:itemcategory)
    @result_shops = @a.result.includes(:itemcategory)
  end

  protected

  def configure_premitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :first_name, :phone_num, :birthday, :nickname])
  end

  def search_shop
    @p = Item.ransack(params[:q])
    @a = Shop.ransack(params[:q])
    @itemcategory_parent_id = Itemcategory.where(ancestry: nil)
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end

