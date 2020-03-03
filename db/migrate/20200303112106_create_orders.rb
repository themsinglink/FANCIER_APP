class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.monetize :amount
      t.string :state
      t.references :article, foreign_key: true
      t.references :user, foreign_key: true
      t.string :checkout_session_id

      t.monetize :amount, currency: { present: false }

      t.timestamps

    end
  end
end
