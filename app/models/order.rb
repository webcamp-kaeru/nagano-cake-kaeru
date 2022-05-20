class Order < ApplicationRecord

  belongs_to :member
  has_many :order_products, dependent: :destroy

  enum payment_method: { credit_card: 0, transfer: 1 }

  def sum_of_order_price
    (billing_amount - shipping).round
  end

  def address_display_order
    '〒' + shipping_postal_code + ' ' + shipping_address
  end

end
