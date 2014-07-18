class Patient < ActiveRecord::Base

  has_many :visits
  has_many :patient_medical_conditions
  has_many :medical_conditions, :through => :patient_medical_conditions


  accepts_nested_attributes_for :patient_medical_conditions, :allow_destroy => true

  def fullname
    [firstname, middlename, lastname].delete_if { |i| i.blank? }.join(' ')
  end

end
