class Product < ApplicationRecord

  has_one_attached :product_image

  def sum_of_order_price
    price * 1.1
  end
end
