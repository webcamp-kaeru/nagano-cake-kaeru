class DeliveryAddress < ApplicationRecord
  belongs_to :member


  validates :address, :shipping_name, presence: true

  def address_display
  '〒' + postal_code + ' ' + address + ' ' + shipping_name
  end

end
