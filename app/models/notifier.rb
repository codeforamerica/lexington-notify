class Notifier
  attr_accessor :error, :twilio_client

  def initialize
    self.twilio_client = Twilio::REST::Client.new(ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN'])
  end

  def send_smses(numbers, message)
    if (numbers.nil?)
      self.error = 'Please select numbers to notify'
      return false
    else
      numbers.each { |number| send_sms(number, message) }
    end
  end

  def send_to_twilio(number, message)
    self.twilio_client.account.messages.create(
      from: ENV['SMS_FROM'],
      to: '+1' + number,
      body: message
    )
  end

  def send_sms(number, message)
    send_to_twilio(number, message)
    SentNotification.create!
  end
end
