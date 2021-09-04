class CreateApplication < ActiveRecord::Migration[5.2]
  def change
    create_table :applications do |t|
      t.string :name
      t.string :full_address
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip_code
      t.text :description
      t.string :application_status

      t.timestamps
    end
  end
end
