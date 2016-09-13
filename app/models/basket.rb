class Basket < ApplicationRecord

  has_many :items, dependent: :destroy
  has_many :products, through: :items

  def quantity
    my_items = self.items
    quantity = 0

    my_items.each do |i|
      quantity += i.quantity
    end
    return quantity
  end

  def total
    return 0 if self.quantity == 0
    my_items = self.items
    total = 0

    my_items.each do |i|
      total += (i.product.price * i.quantity)
    end
    return total
  end
end
