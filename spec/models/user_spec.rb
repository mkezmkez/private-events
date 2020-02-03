require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:username) }
  end
  describe 'associations' do
    it { should have_many(:events_to_go) }
    it { should have_many(:attended_events) }
    it { should have_many(:created_events) }
  end
end
