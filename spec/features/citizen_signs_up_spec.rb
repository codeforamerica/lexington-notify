require 'spec_helper'

describe 'citizen visits signup page' do
  it 'succeeds with valid submission' do
    visit new_citizens_path
    fill_in 'Phone', with: '7739990000'
    expect {click_button 'Submit'}.to change{Phone.count}.by(1)
    expect(page).to have_content('Saved phone number 7739990000')
  end

  it 'errors on invalid phone' do
    visit new_citizens_path
    fill_in 'Phone', with: '9999'
    click_button 'Submit'
    expect(page).to have_content('Please enter valid phone number')
  end
end
