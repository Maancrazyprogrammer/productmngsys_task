class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :p_Name
      t.string :p_Price
      t.binary :p_photo, :limit => 20.0.megabyte

      t.timestamps
    end
  end
end
