class Public::OrdersController < ApplicationController
  layout 'public/application'
  def new
    @order = Order.new
    @delivery_addresses = current_member.delivery_addresses
  end

  def create
  end

  def confirm
    @order = Order.new(order_params)

    # ご自身の住所
    # @order.shipping_postal_code = current_member.postal_code
    # @order.shipping_address = current_member.address
    # @order.shipping_name = current_member.last_name + current_member.first_name

    # 登録済住所
    @address = DeliveryAddress.find(params[:order][:address_id])
    @order.shipping_postal_code = @address.postal_code
    @order.shipping_address = @address.address
    @order.shipping_name = @address.shipping_name

    # 新しい住所
    binding.pry
  end

  def thanks
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :shipping_postal_code, :shipping_address, :shipping_name)
  end
end
