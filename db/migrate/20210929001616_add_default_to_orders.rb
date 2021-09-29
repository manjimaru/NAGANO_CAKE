class AddDefaultToOrders < ActiveRecord::Migration[5.0]
  def change
    change_column_default :orders, :postage, 800
    change_column_default :orders, :payment, 0
    change_column_default :orders, :order_status, 0
  end
end