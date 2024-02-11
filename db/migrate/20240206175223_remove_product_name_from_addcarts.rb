class RemoveProductNameFromAddcarts < ActiveRecord::Migration[7.1]
  def change
    remove_column :addcarts, :productName, :string
  end
end
