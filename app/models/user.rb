class User < ActiveRecord::Base
  has_many :phones
  has_many :addresses
end
