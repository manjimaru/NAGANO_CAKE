class CreateDeliverDestinations < ActiveRecord::Migration[5.0]
  def change
    create_table :deliver_destinations do |t|
      t.integer :customer_id
      t.string :address
      t.string :postcode
      t.string :destination

      t.timestamps
    end
  end
end