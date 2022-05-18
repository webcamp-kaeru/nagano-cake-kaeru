class Admin::ProductsController < ApplicationController
  layout 'admin/application'

  def show
  end

  def index
  end

  def new
    @products = Product.all
  end

  def create
  end

  def edit
  end

  def update
  end

end
