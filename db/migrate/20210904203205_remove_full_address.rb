class RemoveFullAddress < ActiveRecord::Migration[5.2]
  def change
    remove_column :applications, :full_address
  end
end
