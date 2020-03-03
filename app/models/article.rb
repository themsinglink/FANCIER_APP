class Article < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_one_attached :photo
  monetize :price_cents
  validates :photo, presence: true
  validates :name, presence: true
  validates :name, presence: true
  validates :price_cents, presence: true

end
