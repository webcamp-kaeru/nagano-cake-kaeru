class CreateDeliveryAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :delivery_addresses do |t|
      t.integer :member_id
      t.string :postal_code
      t.string :address
      t.string :shipping_name
      t.timestamps
    end
  end
end
