class ChangeDefaultOfUnits < ActiveRecord::Migration[5.1]
  def change
    change_column_default :items, :unit, 1
    change_column_default :order_items, :original_unit, 1
  end
end
