require 'spec_helper'

describe 'admin visits new notification page' do
  it 'sends message' do
    visit new_notifications_path
    fill_in 'Number', with: '3128600685'
    fill_in 'Message', with: 'Hello from test env!'
    click_button 'Submit'
    expect(page).to have_content('sent to')
  end
end
