class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin/application'

  def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products
    @order_product = OrderProduct.find(params[:id])
  end

  def update
     @order = Order.find(params[:id])
     @order_products = @order.order_products
     @order.update(order_params)
     flash[:notice] = "更新しました"
    if @order.order_status == "confirm_payment"
      @order_products.update_all(product_status: "waiting_manufacture")
      redirect_to admin_order_path(@order)
    else
      redirect_to admin_order_path(@order)
    end
  end

  private

  def order_params
  params.require(:order).permit(:order_status)
  end

end