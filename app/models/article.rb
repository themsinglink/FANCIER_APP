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
  has_many :favorites, dependent: :destroy

scope :favorited_by, -> (username) { joins(:favorites).where(favorites: { user: User.where(username: username) }) }

  scope :with_pending_orders, -> do
    joins(:orders).where(orders: { state: 'pending' }).distinct
  end

  scope :with_paid_orders, -> do
    joins(:orders).where(orders: { state: 'paid' }).distinct
  end

  scope :with_shipped_orders, -> do
    joins(:orders).where(orders: { state: 'shipped' }).distinct
  end

  scope :with_delivered_orders, -> do
    joins(:orders).where(orders: { state: 'delivered' }).distinct
  end

  scope :with_cancelled_orders, -> do
    joins(:orders).where(orders: { state: 'cancelled' }).distinct
  end

  include PgSearch::Model
  pg_search_scope :search_by_name_and_color_and_material_and_category,
  # <-- I am not sure if it is OK to put category_id as it refers to another table

    against: [ :name, :color, :material, :category_id],
    using: {
      tsearch: { prefix: true }     },
    associated_against: {
      tags: [:name]
    }

    def active_orders?
      orders.active.any?
    end

    def active_order
      orders.active.first
    end
end



