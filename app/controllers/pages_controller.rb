class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home

    @tags = Tag.all
  
  end

  def about
  end

  def dashboard
  end

end
