class Article < ApplicationRecord
  belongs_to :category
  belongs_to :user

  monetize :price_cents
end
