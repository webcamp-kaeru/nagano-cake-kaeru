class Admin::ProductsController < ApplicationController
  before_action :authenticate_admin!
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
    if @product.save
      flash[:notice] = "商品を登録しました"
      redirect_to admin_product_path(@product)
    else
      @genres = Genre.all
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    @genres = Genre.all
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "商品情報を更新しました"
      redirect_to admin_product_path(@product)
    else
      @genres = Genre.all
      render :edit
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :text, :genre_id, :price, :sales_status, :product_image)
  end

end
