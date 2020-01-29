require 'rails_helper'

RSpec.describe Attendance, type: :model do
  describe 'associations' do
    it { should belong_to(:attendee) }
    it { should belong_to(:attended_event) }
  end
end
