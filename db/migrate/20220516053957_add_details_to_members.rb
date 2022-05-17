class AddDetailsToMembers < ActiveRecord::Migration[6.1]
  def change
    add_column :members, :last_name, :string
    add_column :members, :first_name, :string
    add_column :members, :last_name_kana, :string
    add_column :members, :first_name_kana, :string
    add_column :members, :is_deleted, :boolean
    add_column :members, :postal_code, :string
    add_column :members, :address, :string
    add_column :members, :phone_number, :string
  end
end