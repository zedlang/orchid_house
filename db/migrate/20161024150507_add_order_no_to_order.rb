class AddOrderNoToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :order_no, :string
  end
end
