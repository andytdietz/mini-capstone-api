class RemoveSupplierIdFromSupplierTable < ActiveRecord::Migration[7.1]
  def change
    remove_column :suppliers, :supplier_id
  end
end
