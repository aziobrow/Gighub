class AddUnitToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :units, :integer
  end
end
