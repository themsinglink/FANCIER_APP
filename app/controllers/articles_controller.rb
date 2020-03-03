class ArticlesController < ApplicationController


  def index
    @articles = policy_scope(Article).order(created_at: :desc)
  end



end
