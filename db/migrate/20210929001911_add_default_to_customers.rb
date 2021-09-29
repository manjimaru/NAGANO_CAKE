class AddDefaultToCustomers < ActiveRecord::Migration[5.2]
  def change
    change_column_default :customers, :is_deleted, false
  end
end