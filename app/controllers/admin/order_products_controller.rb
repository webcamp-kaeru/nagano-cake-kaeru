class Admin::OrderProductsController < ApplicationController
  def update
    @order = Order.find(params[:order_id])
    @order_product = OrderProduct.find(params[:id])
    @order_products = @order.order_products
    @order_product.update(order_product_params)
    flash[:notice] = "製作ステータスを更新しました"
      if @order_product.product_status == "manufacturing"
        @order.update(order_status: "making")
        redirect_back fallback_location: root_path
      elsif
        @order_products.count == @order_products.where(product_status: "finish").count
        @order.update(order_status: "preparing_ship")
        redirect_back fallback_location: root_path
      else
        redirect_back fallback_location: root_path
      end
  end

  private

  def order_product_params
    params.require(:order_product).permit(:product_status)
  end

end
