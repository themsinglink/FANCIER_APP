class OrdersController < ApplicationController
  def create
    @order = Order.new(order_params)
    @article = @order.article
    @order.amount = @article.price
    @order.state = :pending
    @order.user = current_user
    authorize @order

    if @order.save
      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [{
          name: @article.name,
          amount: @article.price_cents,
          currency: 'eur',
          quantity: 1
        }],
        success_url: order_url(@order),
        cancel_url: order_url(@order)
      )

      @order.update(checkout_session_id: session.id)
      redirect_to new_order_payment_path(@order)
    else
      flash[:alert] = 'Oops! Something went wrong'
      redirect_to root_path
    end
  end

  def show
    @order = current_user.orders.find(params[:id])
    authorize @order
  end

  def edit
     @order = current_user.orders.find(params[:id])
     authorize @order
  end

  def update
    @order = Order.find(params[:id])
    authorize @order
    if @order.update(order_params)
      redirect_to listings_path
    else
      render :edit
    end
  end

private

  def order_params
     params.require(:order).permit(:name, :street_address, :apartment_number, :city, :state_address, :country, :postal_code, :article_id)
  end
end


