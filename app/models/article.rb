class Article < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_one_attached :photo

  monetize :price_cents
end
