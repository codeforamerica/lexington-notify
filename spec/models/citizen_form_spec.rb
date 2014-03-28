describe CitizenForm do
  it 'errors when no phone number' do
    form = CitizenForm.new(:phone => {})
    expect(form).to_not be_valid
  end

  it 'errors when phone number too short' do
    form = CitizenForm.new(:phone => {number: '123'})
    expect(form).to_not be_valid
  end

  it 'errors when phone number too long' do
    form = CitizenForm.new(:phone => {number: '1234567890000'})
    expect(form).to_not be_valid
  end

  it 'succeeds when valid phone number' do
    form = CitizenForm.new(:phone => {number: '1234567890'})
    expect(form).to be_valid
  end

  it 'succeeds with valid hyphenated phone' do
    form = CitizenForm.new(:phone => {number: '123-456-7890'})
    expect(form).to be_valid
  end
end
