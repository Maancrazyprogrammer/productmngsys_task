class Droptableaddcarts < ActiveRecord::Migration[7.1]
  def change
    drop_table :addcarts
  end
end
