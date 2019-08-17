class AddIndexAttendeeAndEventToAttendance < ActiveRecord::Migration[5.2]
  def change
  	add_reference :attendances, :attendee, index: true
  	add_reference :attendances, :event, index: true
  end
end
