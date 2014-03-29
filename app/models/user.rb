class User < ActiveRecord::Base
  has_many :phones
  has_many :addresses

  def phone
    phones.last.number
  end
end
