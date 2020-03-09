class Order < ApplicationRecord
  belongs_to :article
  belongs_to :user

  has_one :review, dependent: :destroy

  monetize :amount_cents

  enum state: %i[pending paid shipped delivered cancelled refunded]

  validate :article_availability, on: :create
  validate :purchaser, on: :create

  scope :active, -> { where("state < #{self.states[:cancelled]}") }

  def active?
    self.class.states[self.state] < self.class.states[:cancelled]
  end

  private

  def article_availability
    return unless article.active_orders?

    errors.add(:article, message: 'is not available')
  end

  def purchaser
    return unless user == article.user

    errors.add(:user, message: 'cannot order owned articles')
  end
end
