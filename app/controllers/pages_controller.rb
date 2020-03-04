class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about]

  def home

    @tags = Tag.all
  
  end

  def about
  end

  def dashboard
  end

  def listings
  end

end
