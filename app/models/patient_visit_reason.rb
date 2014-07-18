class PatientVisitReason < ActiveRecord::Base

  belongs_to :patient
  belongs_to :reason

end
