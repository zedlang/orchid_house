class Order < ApplicationRecord

  attr_writer :order_number

  has_one :basket

  def set_order_number
    self.order_number = self.id
  end

  def set_status(confirmed)
    if confirmed
      self.status = "confirmed"
    else
      self.status = "pending"
    end
  end
end
