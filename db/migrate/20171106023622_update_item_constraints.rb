class UpdateItemConstraints < ActiveRecord::Migration[5.1]
  def change
    add_index :items, :title, unique: true
    change_column :items, :image_url, :string, :null => true
  end
end
