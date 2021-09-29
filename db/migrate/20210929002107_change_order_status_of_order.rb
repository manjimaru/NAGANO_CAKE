class ChangeOrderStatusOfOrder < ActiveRecord::Migration[5.2]
  def change
    change_column_default :orders, :order_status, 0
  end
end