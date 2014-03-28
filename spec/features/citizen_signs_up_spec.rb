require 'spec_helper'

describe 'citizen visits signup page' do
  it 'succeeds with valid submission' do
    visit root_path
    number = '1234567890'
    fill_in 'Mobile Number', with: number
    expect {click_button 'Submit'}.to change{Phone.count}.by(1)
    expect(page).to have_content("Saved phone number #{number}")
  end

  it 'errors on invalid phone' do
    visit root_path
    fill_in 'Mobile Number', with: '999'
    click_button 'Submit'
    expect(page).to have_content('Please enter valid phone number')
  end

  it 'echos invalid number' do
    visit root_path
    number = '999'
    fill_in 'Mobile Number', with: number
    click_button 'Submit'
    expect(find_field('Mobile Number').value).to eq(number)
  end
end
