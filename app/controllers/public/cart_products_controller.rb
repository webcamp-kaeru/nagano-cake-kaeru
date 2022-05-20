class Public::CartProductsController < ApplicationController
  layout 'public/application'

  def index
    @cart_products = current_member.cart_products
    @total_price = 0
  end

  def create
    @cart_product = CartProduct.new(cart_product_params)
    @cart_product.member_id = current_member.id
    if @cart_product.save
      redirect_to products_path
    else
      render :"products/show"
    end
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  private
  def cart_product_params
    params.require(:cart_product).permit(:product_id, :quantity)
  end
end
