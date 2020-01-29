class User < ApplicationRecord
  validates :name, :email, :username, presence: true
  # has_many :attendances, foreign_key: :attendee_id
  has_many :events_to_go, foreign_key: :attendee_id, class_name: 'Attendance'
  has_many :attended_events, through: :events_to_go, source: :attended_event




  has_many :created_events, foreign_key: :creator_id, class_name: "Event"
end