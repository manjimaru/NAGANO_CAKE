class Customer::CustomersController < ApplicationController
  before_action :authenticate_customer!, only: [:show, :leave, :out, :edit, :update]
  before_action :rule_path, only: [:rule]

  def show
    @customer = current_customer
  end

  def leave
    @customer = current_customer
  end

  def out
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    flash[:alert] = "退会処理が完了しました。"
    redirect_to top_path
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:notice] = "会員情報を更新しました。"
      redirect_to customer_customer_path
    else
      render :edit
    end
  end

  def rule
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone, :email)
  end

  def rule_path
    unless customer_signed_in?
      redirect_to new_customer_registration_path
    end
  end

end