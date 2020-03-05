class Sellers::OrdersController < ApplicationController
  def update
    order = Order.find(params[:id])
    authorize order
    order.update(state: :shipped)
    redirect_to request.referrer
  end
end


