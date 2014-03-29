require 'spec_helper'

describe 'citizen visits signup page' do
  it 'succeeds with valid input' do
    visit root_path
    fill_in 'Mobile Number', with: '123-123-1234'
    street = '123 Main St.'
    fill_in 'Street Address', with: street
    fill_in 'Email Address', with: 'a@b.cc'
    click_button 'Submit'
    user = User.last
    expect(user.email).to eq('a@b.cc')
    expect(user.addresses.last.street).to eq(street)
    expect(user.phones.last.number).to eq('123-123-1234')
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

    fill_in 'Email Address', with: 'a@b.cc'

    click_button 'Submit'
    expect(find_field('Street Address').value).to eq(street)
    expect(find_field('Mobile Number').value).to eq(number)
    expect(find_field('Email Address').value).to eq('a@b.cc')
  end
end
