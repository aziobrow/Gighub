class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :title, null: false
      t.string :image_url, null: false
      t.integer :unit_price, null: false
      t.text :description, null: false
    end
  end
end
