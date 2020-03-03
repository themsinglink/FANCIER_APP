class RemoveStateFromArticles < ActiveRecord::Migration[5.2]
  def change
    remove_column :articles, :state, :string
  end
end
