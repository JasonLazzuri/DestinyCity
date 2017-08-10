class AddOrderIdToAddress < ActiveRecord::Migration[5.1]
  def change
    add_column :addresses, :order_id, :integer, index: { unique: true }, foreign_key: true

    add_column :addresses, :account_id, :integer, foreign_key: true

  end
end
