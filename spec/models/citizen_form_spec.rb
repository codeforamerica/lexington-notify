describe CitizenForm do
  it 'errors when no phone number' do
    form = CitizenForm.new(:address => {})
    expect(form).to_not be_valid
  end

  it 'errors when phone number too short' do
    form = CitizenForm.new(:address => {mobile_number: '123'})
    expect(form).to_not be_valid
  end

  it 'errors when phone number too long' do
    form = CitizenForm.new(:address => {mobile_number: '1234567890000'})
    expect(form).to_not be_valid
  end

  it 'succeeds when valid phone number' do
    form = CitizenForm.new(:address => {mobile_number: '1234567890'})
    expect(form).to be_valid
  end

  it 'succeeds when valid phone number' do
    form = CitizenForm.new(:address => {mobile_number: '1234567890'})
    expect(form).to be_valid
  end

  it 'succeeds with valid hyphenated phone' do
    form = CitizenForm.new(:address => {mobile_number: '123-456-7890'})
    expect(form).to be_valid
  end

  it 'removes non-numeric characters from phone number' do
    form = CitizenForm.new(:address => {mobile_number: '123-456-7890'})
    form.valid?
    expect(form.phone_number).to eq('1234567890')
  end
end
