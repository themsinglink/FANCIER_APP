class OrdersController < ApplicationController
  def create
    article = Article.find(params[:article_id])
    order  = Order.create!(article: article, amount: article.price, state: :pending, user: current_user)
    authorize order

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: article.name,
        #images: article.photo.key,
        amount: article.price_cents,
        currency: 'eur',
        quantity: 1
      }],
      success_url: order_url(order),
      cancel_url: order_url(order)
    )

    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)
  end

  def show
    @order = current_user.orders.find(params[:id])
    authorize @order
  end
end
