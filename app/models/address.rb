class Address < ActiveRecord::Base
  belongs_to :user

  PICKUP = {
    monday: 'Monday',
    tuesday: 'Tuesday',
    thursday: 'Thursday',
    friday: 'Friday',
    daily: 'Daily'
  }
end
