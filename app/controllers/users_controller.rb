class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize @user
    @favorites = @user.favorites
  end

  def index
    @users = User.all
  end
end
