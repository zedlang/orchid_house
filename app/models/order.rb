class Order < ApplicationRecord

  belongs_to :basket

  def set_order_number
    return self.id
  end

  def set_status(confirmed)
    if confirmed
      self.status = "confirmed"
    else
      self.status = "pending"
    end
  end
end
