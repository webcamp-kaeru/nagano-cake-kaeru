class Public::ProductsController < ApplicationController
  layout 'public/application'

  def show
    @product = Product.find(params[:id])
    @genres = Genre.all
  end

  def index
    @products = Product.page(params[:page])
    @products_count = Product.count
    @genres = Genre.all
  end
end
