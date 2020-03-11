class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about]

  def home
    @tags = Tag.all
    @categories = Category.all
                          .with_attached_photo
  end

  def about
  end

  def dashboard
  end

  def listings
    @listings = current_user.articles

    if params[:state].present?
      @listings = @listings.send("with_#{params[:state]}_orders".to_sym)
    end
  end
end
