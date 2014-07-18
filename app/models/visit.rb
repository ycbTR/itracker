class Visit < ActiveRecord::Base
  belongs_to :patient

  has_many :patient_visit_reasons
  has_many :reasons, :through => :patient_visit_reasons

  accepts_nested_attributes_for :patient_visit_reasons, allow_destroy: true
end
