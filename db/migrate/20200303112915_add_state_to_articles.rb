class AddStateToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :state, :integer, default: 0, null: false
  end
end
