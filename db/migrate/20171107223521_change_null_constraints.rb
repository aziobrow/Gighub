class ChangeNullConstraints < ActiveRecord::Migration[5.1]
  def change
    change_column_null :items, :units, false
    change_column_null :users, :name, false
    change_column_null :users, :address, false
    change_column_null :order_items, :units, false
    change_column_null :orders, :original_address, false
  end
end
