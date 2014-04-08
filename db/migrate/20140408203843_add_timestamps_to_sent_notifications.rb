class AddTimestampsToSentNotifications < ActiveRecord::Migration
  def change
    add_column :sent_notifications, :created_at, :datetime
    add_column :sent_notifications, :updated_at, :datetime
  end
end
