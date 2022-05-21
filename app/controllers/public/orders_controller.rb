class Public::OrdersController < ApplicationController
  layout 'public/application'
  def new
    @order = Order.new
    @delivery_addresses = current_member.delivery_addresses
  end

  def create
    @order = Order.new(order_params)

    if @order.save

      @cart_products = current_member.cart_products
      @cart_products.each do |cart_product|
        order_product = OrderProduct.new
        order_product.order_id = @order.id
        order_product.product_id = cart_product.product_id
        order_product.quantity = cart_product.quantity
        order_product.price = cart_product.product.sum_of_order_price
        order_product.product_status = OrderProduct.product_statuses.key(0)
        order_product.save
      end
      redirect_to orders_thanks_path
      @cart_products.destroy_all
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def confirm
    @total_price = 0
    @order = Order.new(order_params)
    if params[:order][:select_address] == "1"
      @order.shipping_postal_code = current_member.postal_code
      @order.shipping_address = current_member.address
      @order.shipping_name = current_member.last_name + current_member.first_name
    elsif params[:order][:select_address] == "2"
      @address = DeliveryAddress.find(params[:order][:address_id])
      @order.shipping_postal_code = @address.postal_code
      @order.shipping_address = @address.address
      @order.shipping_name = @address.shipping_name
    end
    @order.shipping = 800
    @cart_products = current_member.cart_products
    @billing_amount = 0

  end

  def thanks
  end

  def index
    @orders = current_member.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:member_id, :shipping, :shipping_postal_code, :shipping_address, :shipping_name, :payment_method, :order_status, :billing_amount)
  end
end
