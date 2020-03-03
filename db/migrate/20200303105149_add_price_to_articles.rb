class AddPriceToArticles < ActiveRecord::Migration[5.2]
  def change
    add_monetize :articles, :price, currency: { present: false }
  end
end
