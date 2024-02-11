class RemoveTotalPriceFromAddcarts < ActiveRecord::Migration[7.1]
  def change
    remove_column :addcarts, :totalPrice, :string
    
  end
end
