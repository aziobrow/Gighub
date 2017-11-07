class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|

      t.references :order, index: true, foreign_key: true
      t.references :item, index: true, foreign_key: true

      t.integer :original_unit_price, null: false
      t.integer :quantity, null: false

    end
  end
end
