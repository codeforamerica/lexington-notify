class ChangeSentNotifications < ActiveRecord::Migration
  def change
    remove_column :sent_notifications, :user_id
    remove_column :sent_notifications, :method
    add_column :sent_notifications, :mobile_number, :string
    add_column :sent_notifications, :message, :string
  end
end
