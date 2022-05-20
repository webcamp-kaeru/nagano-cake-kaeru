class OrderProduct < ApplicationRecord

  belongs_to :order
  belongs_to :product

    def quantity_price
      (product.sum_of_order_price * quantity).round
    end

end
