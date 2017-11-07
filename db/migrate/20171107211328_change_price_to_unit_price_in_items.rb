class ChangeUnitCostToUnitPriceInItems < ActiveRecord::Migration[5.1]
  def change
    rename_column :items, :unit_cost, :unit_price
  end
end
