class CartProduct < ApplicationRecord

  belongs_to :product
  belongs_to :member

  def subtotal
    product.sum_of_order_price * quantity
  end

end
