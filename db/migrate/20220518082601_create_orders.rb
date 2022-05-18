class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :member_id
      t.integer :shipping
      t.string :shipping_postal_code
      t.string :shipping_address
      t.string :shipping_name
      t.integer :payment_method
      t.integer :order_status
      t.integer :billing_amount

      t.timestamps
    end
  end
end
