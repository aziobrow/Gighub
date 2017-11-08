class RenameColumnUnitsInOrderItemsToOriginalUnit < ActiveRecord::Migration[5.1]
  def change
    rename_column :order_items, :units, :original_unit
  end
end
