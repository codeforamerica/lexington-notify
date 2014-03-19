class CreateSentNotifications < ActiveRecord::Migration
  def change
    create_table :sent_notifications do |t|
      t.integer :user_id
      t.foreign_key :users
      t.string :method
    end
  end
end
