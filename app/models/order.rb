class Order < ApplicationRecord
  belongs_to :article
  belongs_to :user

  monetize :amount_cents

  enum state: %i[pending paid delivered refunded]

end
