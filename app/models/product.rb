class Product < ApplicationRecord

  belongs_to :genre
  has_many :order_products, dependent: :destroy
  has_many :cart_products, dependent: :destroy

  validates :product_image,presence:true
  validates :name,presence:true
  validates :text,presence:true,length:{maximum:200}
  validates :genre_id,presence:true
  validates :price,presence:true
  validates :sales_status, inclusion: {in: [true, false]}



  has_one_attached :product_image

  def get_product_image(width, height)
    product_image.variant(resize_to_limit: [width, height]).processed
  end

  def sum_of_order_price
    (price * 1.1).floor
  end

end
