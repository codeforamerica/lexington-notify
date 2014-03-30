class AddPickupToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :pickup, :string
  end
end
