class Buyers::OrdersController < ApplicationController
  def update
    order = Order.find(params[:id])
    authorize order
    order.update(state: :delivered)
    redirect_to request.referrer
  end
end

