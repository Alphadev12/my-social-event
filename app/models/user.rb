class User < ApplicationRecord
	after_create :welcome_send

	has_many :event_admin, foreign_key: 'admin_id', class_name: 'Event', dependent: :destroy
	has_many :events_attended, foreign_key: 'attendee_id', class_name: 'Attendance', dependent: :destroy

	def welcome_send
    	UserMailer.welcome_email(self).deliver_now
  	end
end
