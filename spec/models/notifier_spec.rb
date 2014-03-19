describe Notifier do
  it 'sends message to each number' do
    notifier = Notifier.new
    notifier.stub(:send_to_twilio)
    expect {
      notifier.send_smses(['5554441111', '666555444'], 'Hello!')
    }.to change{SentNotification.count}.by(2)
  end

  it 'errors if message is greater than specified chars length' do
    notifier = Notifier.new
    message = (1..160).map { 'a' }.join('')
    expect(notifier.valid?(['123'], message)).to be_true
    expect(notifier.valid?(['123'], message + 'a')).to be_false
  end
end
