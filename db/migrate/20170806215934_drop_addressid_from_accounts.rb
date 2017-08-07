class DropAddressidFromAccounts < ActiveRecord::Migration[5.1]
  def change
    remove_column :accounts, :address_id

    add_column :addresses, :account_id, :integer

  end
end
