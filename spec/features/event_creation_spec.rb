require 'rails_helper'

RSpec.describe 'Event Creation', type: :feature, js: true do
  feature 'the creating event process' do
    before(:each) do
      visit new_user_path
      fill_in 'Name', with: 'Master Luis'
      fill_in 'Username', with: 'masterluis'
      fill_in 'Email', with: 'luis@master.com'
      click_on 'Sign Up'
      sleep(1)
      visit new_session_path
      sleep(1)
      fill_in 'Name', with: 'Master Luis'
      sleep(1)
      click_button 'Log in'
    end

    scenario 'goes to root path' do
      expect(page).to have_content 'Master Luis'
    end

    feature 'create an event' do
      scenario 'with valid params' do
        visit new_event_path
        fill_in 'Name your event', with: 'Raggaeton'
        fill_in 'Where?', with: 'LATAM'
        fill_in 'Share the deets:', with: 'Find out yourself'
        click_button 'Create Event'
        sleep(1)
        expect(page).to have_content 'Find out yourself'
        sleep(1)
      end
    end

    scenario 'with invalid params' do
      visit new_event_path
      fill_in 'Name your event', with: 'Capybaras'
      fill_in 'Where?', with: ''
      fill_in 'Share the deets:', with: ''
      click_button 'Create Event'
      sleep(2)
      expect(page).to have_content "can't be blank"
    end

  end
end 
