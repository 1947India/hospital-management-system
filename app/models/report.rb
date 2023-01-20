class Report < ApplicationRecord
	belongs_to :user
	#belongs_to :patient_appointment
	belongs_to :doctor
	has_one_attached :image
end
