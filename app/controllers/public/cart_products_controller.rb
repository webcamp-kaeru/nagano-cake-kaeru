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
    @cart_product = CartProduct.find(params[:id])
      if @cart_product.update(cart_product_params)
        flash[:notice] = "{@cart_product.name}の数量を変更しました"
        redirect_back fallback_location: root_path
      else
        flash.now[:alert] = '{@cart_product.name}の数量を変更できませんでした'
        redirect_back fallback_location: root_path
      end
  end

  def destroy
    @cart_product = CartProduct.find(params[:id])
      if @cart_product.destroy
        flash[:notice] = "カートから{@cart_product.name}を削除しました"
        redirect_back fallback_location: root_path
      else
        flash.now[:alert] = 'カートから{@cart_product.name}を削除できませんでした'
        redirect_back fallback_location: root_path
      end
  end

  def destroy_all
    destroy_all = current_member.cart_products
    if destroy_all.destroy_all
      flash[:notice] = "カートを空にしました"
      redirect_back fallback_location: root_path
    else
      flash.now[:alert] = 'カートを空にできませんでした'
      redirect_back fallback_location: root_path
    end
  end

  private

    def cart_product_params
      params.require(:cart_product).permit(:product_id, :quantity)
    end
end
