describe AddressNotifier, vcr: true do
  it 'sends notifications' do
    FactoryGirl.create(:address, mobile_number: '3125551212')
    AddressNotifier.notify_addresses(Address.all)
    log = SentNotification.last
    expect(log.mobile_number).to eq('3125551212')
  end

  it 'fetches tomorrows addresses' do
    thursday_addr = FactoryGirl.create(:address, pickup: Address::PICKUP.fetch(:thursday))
    friday_addr = FactoryGirl.create(:address, pickup: Address::PICKUP.fetch(:friday))
    random_thursday = Time.zone.local(2015)
    expect(AddressNotifier.tomorrows_addresses(random_thursday)).to eq([friday_addr])
  end

  it 'only fetches unique phones' do
    original = FactoryGirl.create(:address, mobile_number: '123',
      pickup: Address::PICKUP.fetch(:friday))
    dupe = FactoryGirl.create(:address, mobile_number: '123',
      pickup: Address::PICKUP.fetch(:friday))
    random_thursday = Time.zone.local(2015)
    expect(AddressNotifier.tomorrows_addresses(random_thursday)).to eq([original])
  end

  it 'fetches localized message' do
    expect(AddressNotifier.msg!(:pickup_is_tomorrow)).to match(/tomorrow/)
  end
end
