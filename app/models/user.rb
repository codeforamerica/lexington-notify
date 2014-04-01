class User < ActiveRecord::Base
  has_many :addresses

  def phone
    addresses.last.mobile_number
  end
end
