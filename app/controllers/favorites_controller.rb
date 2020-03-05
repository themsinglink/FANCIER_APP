class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_article, except: :index

  def index
    @favorites = policy_scope(Favorite.where(user: current_user))
  end

  def create
    @favorite = Favorite.new(user: current_user, article: @article)
    @favorite.save
    redirect_to articles_path
    authorize @favorite
  end

  def destroy
    @favorite = Favorite.where(user: current_user, article: @article).first
    authorize @favorite
    @favorite.destroy
    redirect_to articles_path
  end

  private

  def find_article
    @article = Article.find(params[:article_id])
  end
end
