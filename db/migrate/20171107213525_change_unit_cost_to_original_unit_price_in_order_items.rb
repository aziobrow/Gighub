class ChangeUnitCostToOriginalUnitPriceInOrderItems < ActiveRecord::Migration[5.1]
  def change
    rename_column :order_items, :original_unit_price, :original_unit_price
  end
end
