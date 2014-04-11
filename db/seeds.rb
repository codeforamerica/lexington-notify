# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Address.delete_all
User.delete_all

2.times do
  user = User.create!(first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name)
  user.addresses.create!(street: Faker::Address.street_address(),
    pickup: 'Thursday',
    mobile_number: Faker::Number.number(10))
end
