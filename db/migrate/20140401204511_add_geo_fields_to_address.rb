class AddGeoFieldsToAddress < ActiveRecord::Migration
  def change
    remove_column :addresses, :point
    add_column :addresses, :lat, :float
    add_column :addresses, :lon, :float
    drop_table :phones
  end
end
