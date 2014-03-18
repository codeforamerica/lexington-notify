class CreateUserAddress < ActiveRecord::Migration
  def up
    execute("CREATE EXTENSION postgis;")
    create_table :addresses do |t|
      t.string :street
      t.column :point, :point
    end
  end

  def down
    drop_table :addresses
    execute("DROP EXTENSION postgis;")
  end
end
