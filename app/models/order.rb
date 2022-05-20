class Order < ApplicationRecord

  belongs_to :member
  has_many :order_products, dependent: :destroy

  def sum_of_order_price
    (billing_amount - 800).round
  end



end
