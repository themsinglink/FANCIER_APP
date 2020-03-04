class TagsController < ApplicationController

  def show
    @tag = Tag.find(params[:id])
    authorize @tag
  end
end
