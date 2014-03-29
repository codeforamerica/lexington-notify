describe AddressNotifier, vcr: true do
  xit 'sends notifications' do
    FactoryGirl.create(:phone, user: FactoryGirl.create(:user), number: '7731231234')
    expect{
      AddressNotifier.notify_tomorrows_addresses
    }.to change{SentNotification.count}.by(1)
  end

  it 'fetches tomorrows addresses' do
    wednesday_addr = FactoryGirl.create(:address, pickup: Address::PICKUP[:wednesday])
    thursday_addr = FactoryGirl.create(:address, pickup: Address::PICKUP[:thursday])
    random_wednesday = Time.zone.local(2014)
    expect(AddressNotifier.tomorrows_addresses(random_wednesday)).to eq([thursday_addr])
  end
end
