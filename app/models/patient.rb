class Patient < ActiveRecord::Base

  has_many :visits, :dependent => :destroy
  has_many :patient_medical_conditions, :dependent => :destroy
  has_many :medical_conditions, :through => :patient_medical_conditions

  validates :firstname, :lastname, :addr1, :city, :state, :zip_code, :date_of_birth, :phone1, presence: true

  accepts_nested_attributes_for :patient_medical_conditions, :allow_destroy => true

  def fullname
    [firstname, middlename, lastname].delete_if { |i| i.blank? }.join(' ')
  end

  def age
    now = Time.now.utc.to_date
    now.year - date_of_birth.year - (date_of_birth.to_date.change(:year => now.year) > now ? 1 : 0)
  end


end
