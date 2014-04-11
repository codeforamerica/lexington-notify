class Notifier
  attr_accessor :error, :twilio_messanger

  def initialize
    twilio_client = Twilio::REST::Client.new(ENV['TWILIO_SID'], ENV['TWILIO_AUTH_TOKEN'])
    self.twilio_messanger = twilio_client.account.messages
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

    numbers.uniq.each { |number| send_sms(number, message) }
  end

  def send_to_twilio(number, message)
    begin
      self.twilio_messanger.create(
        from: ENV['TWILIO_FROM'],
        to: '+1' + number,
        body: message
      )
    rescue StandardError => boom
      puts "could not send #{message} to #{number}. Error " + boom.message
    end
  end

  def send_sms(number, message)
    send_to_twilio(number, message)
    sent = SentNotification.create!(mobile_number: number, message: message)
    Rails.logger.info sent.attributes
  end
end
