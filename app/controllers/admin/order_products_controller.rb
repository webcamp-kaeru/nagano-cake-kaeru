class Admin::OrderProductsController < ApplicationController
  def update
    @order_product = OrderProduct.find(params[:id])
      if @order_product.update(order_product_params)
        flash[:notice] = "製作ステータスを更新しました"
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
