class CreateBaskets < ActiveRecord::Migration[5.0]
  def change
    create_table :baskets do |t|
      t.integer :quantity

      t.timestamps
    end
  end
end
