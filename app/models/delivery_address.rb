class DeliveryAddress < ApplicationRecord
  belongs_to :member

  def address_display
  '〒' + postal_code + ' ' + address + ' ' + shipping_name
  end

end
