class Admin::ProductsController < ApplicationController
  layout 'admin/application'

  def show
  end

  def index
  end

  def new
    @product = Product.new
    # @genres = Genres.all
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to admin_products_path
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to edit_admin_product_path(@product)
  end

  private
  def product_params
    params.require(:product).permit(:name, :text, :genre_id, :price, :sales_status, :product_image)
  end

end
