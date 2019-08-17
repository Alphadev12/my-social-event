class AttendanceMailer < ApplicationMailer
	default from: 'no-reply@monsite.fr'

	def create_attendance(attendent)
		@attendance = attendent

		@url  = 'http://monsite.fr/login'
		mail(to: @attendance.event.admin.email, subject: 'Bienvenue chez nous !')
	end
end
