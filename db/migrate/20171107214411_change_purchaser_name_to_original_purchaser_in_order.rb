class ChangePurchaserNameToOriginalPurchaserInOrder < ActiveRecord::Migration[5.1]
  def change
    rename_column :orders, :original_purchaser, :original_purchaser
  end
end
