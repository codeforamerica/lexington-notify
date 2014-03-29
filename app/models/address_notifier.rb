class AddressNotifier

  def self.tomorrows_addresses(now=Time.zone.now)
    Address.where(pickup: (now + 1.day).strftime('%A'))
  end

  def self.notify_tomorrows_addresses
    self.notify_addresses()
  end

  def self.msg!(key)
    I18n.t!(key, scope: :pickup_msgs)
  end

  def self.notify_addresses(addresses)
    Notifier.new.send_smses(addresses.map{ |a| a.mobile_number }, msg!(:pickup_is_tomorrow))
  end
end
