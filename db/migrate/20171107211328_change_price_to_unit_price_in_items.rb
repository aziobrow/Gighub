class Changeunit_priceToUnitunit_priceInItems < ActiveRecord::Migration[5.1]
  def change
    rename_column :items, :unit_price, :unit_unit_price
  end
end
