require 'spec_helper'

describe 'citizen visits signup page' do
  it 'succeeds with valid submission' do
    visit new_citizens_path
    number = '1234567890'
    fill_in 'Phone', with: number
    expect {click_button 'Submit'}.to change{Phone.count}.by(1)
    expect(page).to have_content("Saved phone number #{number}")
  end

  it 'errors on invalid phone' do
    visit new_citizens_path
    fill_in 'Phone', with: '9999'
    click_button 'Submit'
    expect(page).to have_content('Please enter valid phone number')
  end

  it 'echos invalid number' do
    visit new_citizens_path
    number = '999'
    fill_in 'Phone', with: number
    click_button 'Submit'
    expect(find_field('Phone').value).to eq(number)
  end
end
