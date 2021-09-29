class ChangeIsActiveOfItems < ActiveRecord::Migration[5.2]
  def up
    change_column :items, :is_active, :boolean, default: true, null: true
  end

  def down
    change_column :items, :is_active, :boolean
  end
end