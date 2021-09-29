class Admin::CustomersController < ApplicationController

  before_action :customer_shut_out


  def show
    @customer = Customer.find(params[:id])
  end

  def index
    @customers = Customer.page(params[:page]).per(10)
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    render action: :show
  end

  private
   def customer_params
     params.require(:customer).permit(
       :email,
       :first_name,
       :last_name,
       :first_name_kana,
       :last_name_kana,
       :postcode,
       :address,
       :phone,
       :is_deleted
       )end
end