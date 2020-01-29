require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:description) }
  end

  describe 'associations' do
    it { should have_many(:guests) }
    it { should have_many(:attendances) }
    it { should belong_to(:creator) }
  end
end
