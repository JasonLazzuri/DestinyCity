class AddAddressesToAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :address_id, :integer
  end
end
