class AddressNotifier

  def self.tomorrows_addresses(now=Time.zone.now)
    Address.where(pickup: (now + 1.day).strftime('%A'))
  end

  # def self.notify_tomorrows_addresses
  #   self.notify_addresses('')
  # end

  # def self.notify_addresses(addresses)
  #   notifier = Notifier.new
  #   notifier.send_sms('7738600689', 'foo')
  # end
end
