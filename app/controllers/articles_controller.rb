class ArticlesController < ApplicationController

  def index
    if params[:q].present?
      @articles = Article.search_by_name_and_color_and_material_and_category_id(params[:q])
    else
      @articles = Article.all
    end
    @articles = policy_scope(@articles).order(created_at: :desc)
  end




end
