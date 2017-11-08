class ChangeServiceAddressToOriginalAddressInOrder < ActiveRecord::Migration[5.1]
  def change
    rename_column :orders, :service_address, :original_address
  end
end
