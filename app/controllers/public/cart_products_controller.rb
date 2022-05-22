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
      redirect_to cart_products_path
    else
      flash[:alert] = "個数を選択してください"
      redirect_back fallback_location: root_path
    end
  end

  def update
    @cart_product = CartProduct.find(params[:id])
      if @cart_product.update(cart_product_params)
        flash[:notice] = "商品の数量を#{@cart_product.quantity}つに変更しました"
        redirect_back fallback_location: root_path
      else
        flash[:alert] = "商品の数量を#{@cart_product.quantity}つに変更できませんでした"
        redirect_back fallback_location: root_path
      end
  end

  def destroy
    @cart_product = CartProduct.find(params[:id])
      if @cart_product.destroy
        flash[:notice] = @cart_product.product.name + "を削除しました"
        redirect_back fallback_location: root_path
      else
        flash.now[:alert] = @cart_product.product.name + "を削除しました"
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
