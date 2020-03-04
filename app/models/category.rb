class Category < ApplicationRecord
  has_many :articles

  # TODO: Figure out a way to only get categories with results
  # scope :with_articles_for_tag, -> (name) do
  # end

  def articles_by_tag(name)
    articles.joins(:tags)
            .where(tags: { name: name })
  end
end
