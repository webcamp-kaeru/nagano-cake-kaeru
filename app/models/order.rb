class Order < ApplicationRecord

  belongs_to :member
  has_many :order_products, dependent: :destroy

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum order_status: { wait_payment: 0, confirm_payment: 1, making: 2, preparing_ship: 3, sent: 4 }

  def sum_of_order_price
    (billing_amount - shipping).round
  end

  def address_display_order
    '〒' + shipping_postal_code + ' ' + shipping_address
  end

end
