class CartProduct < ApplicationRecord
  belongs_to :product
  belongs_to :member

  validates :quantity,presence:true


  def subtotal
    product.sum_of_order_price * quantity
  end

end
