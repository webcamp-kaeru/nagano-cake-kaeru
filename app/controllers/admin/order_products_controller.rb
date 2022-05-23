class Admin::OrderProductsController < ApplicationController
  def update
    @order_products = OrderProduct.all
    @order_product = OrderProduct.find(params[:id])
    @order = @order_product.order

      if @order_product.product_status == "manufacturing"
        @order.update(order_status: "making")
        flash[:notice] = "製作ステータスを更新しました"
        redirect_to admin_order_path(@order)
      elsif　@order_products.product_status == "finish"
        @order.update(order_status: "preparing_ship")
        flash[:notice] = "製作ステータスを更新しました"
        redirect_to admin_order_path(@order)
      else
        redirect_back fallback_location: root_path
      end
  end

end
