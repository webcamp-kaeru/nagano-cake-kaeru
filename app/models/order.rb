class Order < ApplicationRecord

  belongs_to :member
  has_many :order_products, dependent: :destroy

  enum payment_method: { credit_card: 0, transfer: 1 }

end
