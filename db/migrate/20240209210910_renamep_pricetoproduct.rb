class RenamepPricetoproduct < ActiveRecord::Migration[7.1]
  def change
   rename_column :products, :price, :p_price

  end
end
