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
    all.map(&:color).uniq
  end

  def self.available_size
    all.map(&:size).uniq
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



