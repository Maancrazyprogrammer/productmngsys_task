class RemovePhotoFromAddcarts < ActiveRecord::Migration[7.1]
  def change
    remove_column :addcarts, :photo, :binary
  end
end
