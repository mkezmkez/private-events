class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
# has_many :guests, class_name: "Attendance", foreign_key: :attendee_id
  has_many :attendances, foreign_key: :attended_event_id, class_name: "Attendance"
  has_many :guests, through: :attendances, source: :attendee
  #has_many :attendees, through: :guests, source: :attendee

end
