class Public::OrdersController < ApplicationController
  layout 'public/application'
  def new
    @order = Order.new
    @delivery_addresses = current_member.delivery_addresses
  end

  def create
  end

  def confirm
    @order = Order.new(order_params)
  end

  def thanks
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:payment_method)
  end
end
