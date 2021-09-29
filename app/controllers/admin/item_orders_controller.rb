class Admin::ItemOrdersController < ApplicationController


  before_action :customer_shut_out


  def update
    item_order = ItemOrder.find(params[:id])
    item_orders = ItemOrder.where(order_id: item_order.order_id)
    order = item_order.order
    item_order.update(item_order_params)
    if item_orders.all?{ |item_order| item_order.maiking_status === "製作完了" }
      order.update(complete_order_params)
    else
      if item_order.maiking_status === "製作中"
        order.update(order_params)
      end
    end
    redirect_to admin_order_path(item_order.order_id)
  end

  private
    def item_order_params
      params.require(:item_order).permit(:maiking_status).merge(maiking_status: params[:item_order][:maiking_status].to_i)
    end

    def order_params
      params.permit(:order_status).merge(order_status: 2)
    end

    def complete_order_params
      params.permit(:order_status).merge(order_status: 3)
    end
end