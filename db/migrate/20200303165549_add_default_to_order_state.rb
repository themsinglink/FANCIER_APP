class AddDefaultToOrderState < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :state, :integer, null: false, default: 0
  end
end
