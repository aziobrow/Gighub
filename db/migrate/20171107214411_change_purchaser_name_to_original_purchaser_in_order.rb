class ChangePurchaserNameToOriginalPurchaserInOrder < ActiveRecord::Migration[5.1]
  def change
    rename_column :orders, :purchaser_name, :original_purchaser
  end
end
