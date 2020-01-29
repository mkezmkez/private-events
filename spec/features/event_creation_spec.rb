require 'rails_helper'

RSpec.describe 'Event Creation', type: :feature, js: true do
  feature 'the creating event process' do
    before(:each) do
      visit new_user_path
      fill_in 'Name', with: 'Master Luis'
      fill_in 'Username', with: 'masterluis'
      fill_in 'Email', with: 'luis@master.com'
      click_on 'Sign Up'
      visit new_session_path
      fill_in 'Name', with: 'Master Luis'
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
        expect(page).to have_content 'Find out yourself'
      end
    end

    scenario 'with invalid params' do
      visit new_event_path
      fill_in 'Name your event', with: 'Capybaras'
      fill_in 'Share the deets:', with: ''
      click_button 'Create Event'
      expect(page).to have_content "can't be blank"
    end
  end
end
