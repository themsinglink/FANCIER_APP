class Tag < ApplicationRecord

  include PgSearch::Model
  multisearchable against: [ :name ]

end
