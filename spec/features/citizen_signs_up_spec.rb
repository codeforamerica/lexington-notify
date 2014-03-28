require 'spec_helper'

describe 'citizen visits signup page' do
  it 'succeeds with valid phone number' do
    visit root_path
    number = '1234567890'
    fill_in 'Mobile Number', with: number
    expect {click_button 'Submit'}.to change{Address.count}.by(1)
    expect(page).to have_content("Saved phone number #{number}")
  end

  it 'succeeds with valid address' do
    visit root_path
    fill_in 'Mobile Number', with: '123-123-1234'
    street = '123 Main St.'
    fill_in 'Street Address', with: street
    click_button 'Submit'
    expect(Address.last.street).to eq(street)
  end

  it 'errors on invalid phone' do
    visit root_path
    fill_in 'Mobile Number', with: '999'
    click_button 'Submit'
    expect(page).to have_content('Please enter valid phone number')
  end

  it 'echos invalid data' do
    visit root_path
    number = '999'
    fill_in 'Mobile Number', with: number

    street = '123 Main St.'
    fill_in 'Street Address', with: street

    click_button 'Submit'
    expect(find_field('Street Address').value).to eq(street)
    expect(find_field('Mobile Number').value).to eq(number)
  end
end
