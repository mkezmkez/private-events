require 'rails_helper'

 RSpec.describe 'the signup process', type: :feature, js: true do

  scenario 'has a new user page' do
    visit new_user_path
    sleep(1)
    expect(page).to have_content 'join'
  end

  feature 'signing up a user' do
    before(:each) do
      visit new_user_path
      fill_in 'Name', with: 'Master Luis'
      sleep(2)
      fill_in 'Username', with: 'masterluis'
      sleep(2)
      fill_in 'Email', with: 'luis@master.com'
      sleep(2)
      click_on 'Sign Up'
    end

    scenario 'redirects show_user_path' do
      sleep(1)
      expect(page).to have_content 'Master Luis'
    end

  end

end
