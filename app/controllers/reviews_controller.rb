class ReviewsController < ApplicationController

  before_action :set_order, only: [:new, :create]

  def new
    @review = Review.new
    @review.user = current_user
    @review.order = @order
    authorize @review
  end

  def create
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
