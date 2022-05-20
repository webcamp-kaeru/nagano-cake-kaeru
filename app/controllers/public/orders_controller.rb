class Public::OrdersController < ApplicationController
  layout 'public/application'
  def new
  end

  def create
  end

  def confirm
  end

  def thanks
  end

  def index
    @orders = Order.all
    @order_products = OrderProduct.all
  end

  def show
    @order = Order.find(params[:id])
    @order_products = OrderProduct.all
  end
end
