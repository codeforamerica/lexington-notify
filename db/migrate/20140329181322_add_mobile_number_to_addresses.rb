class AddMobileNumberToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :mobile_number, :string
  end
end
