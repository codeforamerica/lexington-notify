describe AddressNotifier, vcr: true do
  it 'sends notifications' do
    FactoryGirl.create(:address, mobile_number: '3125551212')
    AddressNotifier.notify_addresses(Address.all)
    log = SentNotification.last
    expect(log.mobile_number).to eq('3125551212')
  end

  it 'fetches tomorrows addresses' do
    wednesday_addr = FactoryGirl.create(:address, pickup: Address::PICKUP[:wednesday])
    thursday_addr = FactoryGirl.create(:address, pickup: Address::PICKUP[:thursday])
    random_wednesday = Time.zone.local(2014)
    expect(AddressNotifier.tomorrows_addresses(random_wednesday)).to eq([thursday_addr])
  end

  it 'fetches localized message' do
    expect(AddressNotifier.msg!(:pickup_is_tomorrow)).to match(/tomorrow/)
  end
end
