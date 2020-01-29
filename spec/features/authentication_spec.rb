require "rails_helper"

# RSpec.describe Authentication do
feature 'the signup process' do

  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content 'New User'
  end

end
