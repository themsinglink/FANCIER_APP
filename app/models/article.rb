class Article < ApplicationRecord
  belongs_to :category
  belongs_to :user

  has_many :orders

  has_many :article_tags
  has_many :tags, through: :article_tags

  has_many_attached :photos

  monetize :price_cents

  validates :photos, presence: true

  validates :name, presence: true
  validates :name, presence: true
  validates :price_cents, presence: true
  has_many :favorites, dependent: :destroy

  scope :with_tags, -> (tag_names) do
    Article.joins(:tags).where(tags: { name: tag_names } )
  end

  scope :favorited_by, -> (username) { joins(:favorites).where(favorites: { user: User.where(username: username) }) }

  scope :available, -> do
    includes(:orders).where(orders: { id: nil })
                     .or(Article.with_cancelled_orders)
  end

  scope :with_pending_orders, -> do
    includes(:orders).where(orders: { state: 'pending' })
  end

  scope :with_paid_orders, -> do
    includes(:orders).where(orders: { state: 'paid' })
  end

  scope :with_shipped_orders, -> do
    includes(:orders).where(orders: { state: 'shipped' })
  end

  scope :with_delivered_orders, -> do
    includes(:orders).where(orders: { state: 'delivered' })
  end

  scope :with_cancelled_orders, -> do
    includes(:orders).where(orders: { state: 'cancelled' })
  end

  def self.available_colors
    pluck(:color).reject(&:nil?).uniq
  end

  def self.available_size
    pluck(:size).reject(&:nil?).uniq
  end

  ransacker :price_money, type: :integer, formatter: proc { |dollars| dollars * 100 } do |p|
    p.table[:price_cents]
  end

  include PgSearch::Model
  pg_search_scope :search_by_name_and_color_and_material_and_category,
  # <-- I am not sure if it is OK to put category_id as it refers to another table

    against: [ :name, :color, :material],
    using: {
      tsearch: { prefix: true }     },
    associated_against: {
      category: [:name],
      tags: [:name]
    }

  def active_orders?
    orders.active.any?
  end

  def active_order
    orders.active.first
  end
end



