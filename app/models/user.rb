class User < ApplicationRecord
	has_many :event_admin, foreign_key: 'admin_id', class_name: 'Event', dependent: :destroy
	has_many :events_attended, foreign_key: 'attendee_id', class_name: 'Attendance', dependent: :destroy
end
