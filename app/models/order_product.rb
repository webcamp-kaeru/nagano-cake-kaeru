class OrderProduct < ApplicationRecord

  belongs_to :order
  belongs_to :product

  enum product_status: { impossible_manufacture: 0, waiting_manufacture: 1, manufacturing: 2, finish: 3 }

    def quantity_price
      (product.sum_of_order_price * quantity).round
    end

end
