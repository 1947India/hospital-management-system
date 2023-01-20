class Doctor < ApplicationRecord
 after_create :generate_api_key
 validates :name, presence: true
 has_many :patient_appointments
 #has_many :users, through: :patient_appointment
 has_one_attached :image
 has_many :reports

  def fullname
     "#{first_name} #{last_name}"
  end
  
  def generate_api_key
    self.unique_code = SecureRandom.base64(10)
  end
  # require 'securerandom'
end
