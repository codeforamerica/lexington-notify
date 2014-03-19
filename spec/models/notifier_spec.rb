describe Notifier do
  it 'sends message to each number' do
    notifier = Notifier.new
    notifier.stub(:send_to_twilio)
    expect {
      notifier.send_smses(['5554441111', '666555444'], 'Hello!')
    }.to change{SentNotification.count}.by(2)
  end
end
