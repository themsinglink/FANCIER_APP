class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize @user
    @favorites = @user.favorites
  end

  def index
    @users = User.all
  end

  def reviews
    @reviews = policy_scope(Review.where user: User.find(params[:id]))
    authorize @reviews
  end

  def edit
    @user = current_user
    authorize @user
  end

  def update
    @user = current_user
    current_user.update(user_params)
    authorize @user
    if @user.save
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:photo)
  end

end
