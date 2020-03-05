class AddFieldsToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :name, :string
    add_column :orders, :street_address, :string
    add_column :orders, :apartment_number, :string
    add_column :orders, :city, :string
    add_column :orders, :state_address, :string
    add_column :orders, :country, :string
    add_column :orders, :postal_code, :string
  end
end
