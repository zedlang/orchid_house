class AddForeignKeyToAddress < ActiveRecord::Migration[5.0]
  def change
    add_column :addresses, :user_id, :integer, index: true, foreign_key: true
  end
end
