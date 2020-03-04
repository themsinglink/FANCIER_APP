class Article < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :orders
  has_many :article_tags
  has_many :tags, through: :article_tags
  has_one_attached :photo
  monetize :price_cents
  validates :photo, presence: true
  validates :name, presence: true
  validates :name, presence: true
  validates :price_cents, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_name_and_color_and_material_and_category,
  # <-- I am not sure if it is OK to put category_id as it refers to another table

    against: [ :name, :color, :material, :category_id],
    using: {
      tsearch: { prefix: true }     },
    associated_against: {
      tags: [:name]
    }

end



