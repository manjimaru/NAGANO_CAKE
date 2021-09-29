class CreateItemOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :item_orders do |t|
      t.integer :item_id
      t.integer :order_id
      t.integer :quantity
      t.integer :maiking_status
      t.integer :tax_price

      t.timestamps
    end
  end
end