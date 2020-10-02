class CustomersController < ApplicationController

  def show
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    if current_customer.update(customer_params)
      redirect_to customer_path(current_customer)
    else
      redirect_to "edit"
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:nickname, :family_name, :first_name, :email, :phone_num)
  end
end
