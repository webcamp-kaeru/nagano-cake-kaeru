class Public::CartProductsController < ApplicationController
  layout 'public/application'

  def index
    @cart_products = CartProduct.all
    @total_price = 0
  end

  def create
    @cart_product = CartProduct.new
    @product = Product.find(cart_product_params[:product_id])
    @cart_product.member_id = current_member.id
    @cart_product.product_id = @product.id
    if @product.save
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
