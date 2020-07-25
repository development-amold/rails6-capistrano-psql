class AddAddressToAccount < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :address, :text
  end
end
