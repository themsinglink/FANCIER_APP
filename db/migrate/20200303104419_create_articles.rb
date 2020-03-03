class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :name
      t.references :category, foreign_key: true
      t.string :color
      t.string :size
      t.string :state
      t.string :material
      t.integer :shipping_costs
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
