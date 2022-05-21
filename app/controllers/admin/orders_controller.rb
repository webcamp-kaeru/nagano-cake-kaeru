class Admin::OrdersController < ApplicationController
  layout 'admin/application'

  def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products
    @order_product = OrderProduct.find(params[:id])
  end

  def update
  end
end
