class User < ApplicationRecord
	has_many :event_admin, foreign_key: 'admin_id', class_name: 'Event', dependent: :destroy
end
