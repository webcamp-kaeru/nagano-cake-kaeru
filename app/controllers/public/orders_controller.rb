class Public::OrdersController < ApplicationController
  layout 'public/application'
  def new
    @order = Order.new
    @delivery_addresses = current_member.delivery_addresses
  end

  def create
    @order = Order.new(order_params)
    binding.pry
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:select_address] == "1"
      # ご自身の住所
      @order.shipping_postal_code = current_member.postal_code
      @order.shipping_address = current_member.address
      @order.shipping_name = current_member.last_name + current_member.first_name
    elsif params[:order][:select_address] == "2"
      # 登録済住所
      @address = DeliveryAddress.find(params[:order][:address_id])
      @order.shipping_postal_code = @address.postal_code
      @order.shipping_address = @address.address
      @order.shipping_name = @address.shipping_name
    end
    @order.shipping = 800
    # @order.billing_amount =

    @order_products = current_member.order_products

  end

  def thanks
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:member_id, :shipping, :shipping_postal_code, :shipping_address, :shipping_name, :payment_method, :order_status, :billing_amount)
  end
end
