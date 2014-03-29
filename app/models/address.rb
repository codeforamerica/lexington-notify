class Address < ActiveRecord::Base
  belongs_to :user
  PICKUP = {
    wednesday: 'Wednesday',
    thursday: 'Thursday'
  }
end
