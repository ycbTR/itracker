class PatientMedicalCondition < ActiveRecord::Base

  belongs_to :patient
  belongs_to :medical_condition

end
