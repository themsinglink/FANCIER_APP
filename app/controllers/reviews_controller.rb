class ReviewsController < ApplicationController

  before_action :set_order, only: []

  def new
    #@order = current_user.orders.first
    @review = Review.new
    @review.user = current_user
    @review.order = @order
    @user = User.find(params[:user_id])
    authorize @review
  end

  def index
    @reviews = policy_scope(Review.all)
    @user = User.find(params[:user_id])
  end

  def create
    @order = current_user.orders.first
    @review = Review.new(review_params)
    @review.user = current_user
    @review.order = @order
    authorize @review
    if @review.save
      redirect_to dashboard_path
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_order
    @order = Order.find(params[:order_id])
  end

end
