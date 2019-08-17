class Attendance < ApplicationRecord
	after_create :create_attendance_send

	belongs_to :event
	belongs_to :attendee, class_name: 'User'

	def create_attendance_send
    	AttendanceMailer.create_attendance(self).deliver_now
  	end
end
