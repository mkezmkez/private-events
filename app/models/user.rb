class User < ApplicationRecord
    validates :name, :email, :username, presence:true

    has_many :attendances, foreign_key: :attendee_id
    has_many :attended_events, through: :attendances, source: :attended_event
    has_many :created_events, foreign_key: :creator_id, class_name: "Event"
end