class Addroletouser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :role, :integer, :default => 0
    #Ex:- :default =>''
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
