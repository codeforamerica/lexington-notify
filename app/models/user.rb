class User < ActiveRecord::Base
  has_many :addresses

  def address
    addresses.last
  end

  def phone
    address.mobile_number
  end

  def pickup
    address.pickup
  end

  def daily_pickup?
    address.pickup == 'Daily'
  end
end
