class Renamequantitytocart < ActiveRecord::Migration[7.1]
  def change
   rename_column :carts, :quantity, :quantities
   #Ex:- rename_column("admin_users", "pasword","hashed_pasword") :users, :role, :integer
  end
end
