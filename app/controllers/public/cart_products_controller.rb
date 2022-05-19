class Public::CartProductsController < ApplicationController
  layout 'public/application'
  def index
    @cart_product = CartProduct.new
  end

  def create
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end
end
