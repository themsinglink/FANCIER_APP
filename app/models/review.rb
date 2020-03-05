class Review < ApplicationRecord
  belongs_to :user
  belongs_to :order

  validates :user, uniqueness: { scope: :order}

end
