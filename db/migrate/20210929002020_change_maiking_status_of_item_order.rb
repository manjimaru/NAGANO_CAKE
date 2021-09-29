class ChangeMaikingStatusOfItemOrder < ActiveRecord::Migration[5.2]
  def change
    change_column_default :item_orders, :maiking_status, 0
  end
end