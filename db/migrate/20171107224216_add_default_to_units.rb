class AddDefaultToUnits < ActiveRecord::Migration[5.1]
  def change
    change_column_default :items, :units, 2
    change_column_default :order_items, :units, 2
  end
end
