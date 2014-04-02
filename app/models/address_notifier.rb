class AddressNotifier

  def self.tomorrows_addresses(now=Time.zone.now)
    Address.where(pickup: (now + 1.day).strftime('%A')).to_a.uniq do |a|
      a.mobile_number
    end
  end

  def self.notify_tomorrows_addresses
    self.notify_addresses(self.tomorrows_addresses)
  end

  def self.msg!(key)
    I18n.t!(key, scope: :pickup_msgs)
  end

  def self.notify_addresses(addresses)
    numbers = addresses.map{ |a| a.mobile_number }
    Notifier.new.send_smses(numbers, msg!(:pickup_is_tomorrow))
  end
end
