class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  has_many :articles
  has_many :reviews

  has_many :favorites
  has_many :favorites, dependent: :destroy

  def favorite(article)
   favorites.find_or_create_by(article: article)
  end

  def unfavorite(article)
   favorites.where(article: article).destroy_all

   article.reload
  end

  def rating
    ratings = []
    self.articles.each do |article|
      if article.orders&.first&.review
        ratings << article&.orders&.first&.review&.rating
      end
    end
    ratings.size >= 1 ? rating = ratings.sum / ratings.size : rating = 0
    return rating
  end


end


