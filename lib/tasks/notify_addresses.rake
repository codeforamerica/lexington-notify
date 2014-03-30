desc "Notify addresses"
namespace :notify_addresses do
  task :pickup_tomorrow => :environment do
    AddressNotifier.notify_tomorrows_addresses
  end
end
