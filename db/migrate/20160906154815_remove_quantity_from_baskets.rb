class RemoveQuantityFromBaskets < ActiveRecord::Migration[5.0]
  def change
    remove_column :baskets, :quantity, :integer
  end
end
