class AddOrderToBasket < ActiveRecord::Migration[5.0]
  def change
    add_reference :baskets, :order, foreign_key: true
  end
end
