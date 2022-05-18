class Order < ApplicationRecord
  
  belongs_to :member
  has_many :order_products, dependent: :destroy
  
end
