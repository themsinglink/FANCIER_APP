class OrdersController < ApplicationController
  def create
    @order = Order.new(order_params)
    @article = @order.article
    @order.amount = @article.price
    @order.state = :pending
    @order.user = current_user
    @order.save
    authorize @order

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: @article.name,
        #images: article.photo.key,
        amount: @article.price_cents,
        currency: 'eur',
        quantity: 1
      }],
      success_url: order_url(@order),
      cancel_url: order_url(@order)
    )

    @order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(@order)
  end

  def show
    @order = current_user.orders.find(params[:id])
    authorize @order
  end


  private

  def order_params
     params.require(:order).permit(:name, :street_address, :apartment_number, :city, :state_address, :country, :postal_code, :article_id)
  end
end
