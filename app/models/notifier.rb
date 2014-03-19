class Notifier
  attr_accessor :error, :twilio_client

  def initialize
    self.twilio_client = Twilio::REST::Client.new(ENV['TWILIO_SID'], ENV['TWILIO_AUTH_TOKEN'])
  end

  def valid?(numbers, message)
    if (numbers.nil?)
      self.error = 'Please select numbers to notify'
    elsif (message.length > 160)
      self.error = 'Please limit message to 160 chars'
    end

    return ! self.error
  end

  def send_smses(numbers, message)
    return false unless (valid?(numbers, message))

    numbers.each { |number| send_sms(number, message) }
  end

  def send_to_twilio(number, message)
    self.twilio_client.account.messages.create(
      from: ENV['TWILIO_FROM'],
      to: '+1' + number,
      body: message
    )
  end

  def send_sms(number, message)
    send_to_twilio(number, message)
    SentNotification.create!
  end
end
