class Admin::ProductsController < ApplicationController
  layout 'admin/application'

  def show
    @product = Product.find(params[:id])

  end

  def index
     @products = Product.page(params[:page])
  end

  def new
    @product = Product.new
    @genres = Genre.all
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to admin_product_path(@product)
  end

  def edit
    @product = Product.find(params[:id])
    @genres = Genre.all
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to admin_product_path(@product)
  end

  private
  def product_params
    params.require(:product).permit(:name, :text, :genre_id, :price, :sales_status, :product_image)
  end

end
