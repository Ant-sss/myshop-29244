# frozen_string_literal: true

class Shopkeepers::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  def new
    @shopkeeper = Shopkeeper.new
  end

  def create
    @shopkeeper = Shopkeeper.new(sign_up_params)
      unless @shopkeeper.valid?
        render :new and return
      end
    session["devise.regist_data"] = {shopkeeper: @shopkeeper.attributes}
    session["devise.regist_data"][:shopkeeper]["password"] = params[:shopkeeper][:password]
    @address = @shopkeeper.build_address
    render :new_address
  end

  def create_address
    @shopkeeper = Shopkeeper.new(session["devise.regist_data"]["shopkeeper"])
    @address = Address.new(address_params)
      unless @address.valid?
        render :new_address
      end
    @shopkeeper.build_address(@address.attributes)
    @shopkeeper.save
    session["devise.regist_data"]["shopkeeper"].clear
    sign_in(:shopkeeper, @shopkeeper)
  end

  protected

  def address_params
    params.require(:address).permit(:postal_code, :prefecture_id, :city, :house_num, :building_name)
  end
  
  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
