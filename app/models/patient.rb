class Patient < ActiveRecord::Base

  has_many :visits
  has_many :patient_medical_conditions

end
