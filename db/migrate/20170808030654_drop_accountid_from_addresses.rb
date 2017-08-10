class DropAccountidFromAddresses < ActiveRecord::Migration[5.1]
  def change
    remove_column :addresses, :account_id

    add_column :accounts, :address_id, :integer

  end
end
