class Admin::HomesController < ApplicationController
   before_action :authenticate_admin!
   layout 'admin/application'

  def top
    @orders = Order.page(params[:page]).order(id: :DESC)
    @total_quantity = 0
  end
end
