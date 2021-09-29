class Admin::OrdersController < ApplicationController

  before_action :customer_shut_out



  def index
    @orders = Order.page(params[:page]).per(10)
  end

  def current_user_order
    @orders = Order.where(customer_id: params[:id]).page(params[:page]).per(10)
    render action: :index
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    item_orders = @order.item_orders
    @order.update(order_params)
    if @order.order_status === "入金確認"
      item_orders.each do |item_order|
        item_order.update(item_order_params)
      end
    end
    @orders = Order.page(params[:page]).per(10)
    redirect_to admin_orders_path
  end

  private

    def item_order_params
      params.permit(:maiking_status).merge(maiking_status: 1)
    end

    def order_params
      params.require(:order).permit(:order_status).merge(order_status: params[:order][:order_status].to_i)
    end

end