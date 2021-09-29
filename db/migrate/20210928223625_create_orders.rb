class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :postage
      t.integer :tax_price
      t.integer :payment
      t.string :postcode
      t.string :address
      t.string :destination
      t.integer :order_status

      t.timestamps
    end
  end
end