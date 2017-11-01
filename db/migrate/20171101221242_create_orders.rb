class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :shipping_address, null: false
      t.references :user, index: true, foreign_key: true
    end
  end
end
