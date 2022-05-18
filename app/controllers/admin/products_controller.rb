class Admin::ProductsController < ApplicationController
  layout 'admin/application'

  def show
    @product = Product.find(params[:id])
    
  end

  def index
     @products = Product.page(params[:page])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

end
