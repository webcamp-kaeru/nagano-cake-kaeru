class OrderProduct < ApplicationRecord

  belongs_to :order
  belongs_to :product

    def quantity_price
      (price * quantity).round
    end

end
