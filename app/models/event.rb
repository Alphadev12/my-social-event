class Event < ApplicationRecord


	validates :start_date,
	presence: true
	validate :validate_start_date?

	validates :duration,
	presence: true
	validate :validate_duration?

	validates :title,
	presence: true,
	length: { in: 5..140 }

	validates :description,
	presence: true,
	length: { in: 20..1000 }

	validates :price,
	presence: true
	validates_numericality_of :price, :greater_than => 0, :less_than => 1001

	validates :location,
	presence: true

	def validate_start_date?
		if start_date < Time.now
			errors.add(:start_date, "La date ne doit pas être une date antérieur")
		end
	end

	def validate_duration?
		unless duration > 0 && duration % 5 == 0
			errors.add(:duration, "La durer doit être un multiple de 5")
		end
	end

	belongs_to :admin, class_name: 'User'

	has_many :attendances
	has_many :attendees, through: :attendances
end
