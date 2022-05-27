class ChangeColumnDefaultToProducts < ActiveRecord::Migration[6.1]
  def change
    change_column_default :products, :sales_status, from: nil, to: true
  end
end
