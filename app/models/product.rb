class Product < ApplicationRecord

  belongs_to :genre
  has_many :order_products, dependent: :destroy
  has_many :cart_products, dependent: :destroy

  has_one_attached :product_image

  def sum_of_order_price
    (price * 1.1).round
  end

end
