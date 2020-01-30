class Event < ApplicationRecord
  validates :description, presence: true
  belongs_to :creator, class_name: 'User'
  # has_many :guests, class_name: "Attendance", foreign_key: :attendee_id
  has_many :attendances, foreign_key: :attended_event_id, class_name: 'Attendance'
  has_many :guests, through: :attendances, source: :attendee
  # has_many :attendees, through: :guests, source: :attendee

  scope :previous_events, -> { where('date < ?', Time.now) }
  scope :upcoming_events, -> { where('date > ?', Time.now) }
end
