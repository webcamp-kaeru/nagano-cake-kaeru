class Public::HomesController < ApplicationController
  layout 'public/application'

  def top
    @products = Product.limit(4).order(id: :DESC)
    @genres = Genre.all
  end

  def about
  end
end
