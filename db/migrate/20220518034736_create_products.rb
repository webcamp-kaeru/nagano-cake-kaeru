class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.integer :genre_id
      t.string :name
      t.text :text
      t.integer :price
      t.boolean :sales_status

      t.timestamps
    end
  end
end
