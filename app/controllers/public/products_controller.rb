class Public::ProductsController < ApplicationController
  before_action :authenticate_member!, except:[:show, :index]
  layout 'public/application'

  def show
    @product = Product.find(params[:id])
    @genres = Genre.all
    @cart_product = CartProduct.new
  end

  def index
    @products = Product.page(params[:page])
    @products_count = Product.count
    @genres = Genre.all
  end
end
