class Admin::HomesController < ApplicationController
   layout 'admin/application'

  def top
    @orders = Order.page(params[:page])
    @total_quantity = 0
  end
end
