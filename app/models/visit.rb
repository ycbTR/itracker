class Visit < ActiveRecord::Base
  belongs_to :patient
  has_many :patient_visit_reasons, :dependent => :destroy
  has_many :handle_patient_visits, :dependent => :destroy
  has_many :reasons, :through => :patient_visit_reasons

  has_many :exams, as: :viewable

  accepts_nested_attributes_for :patient_visit_reasons, allow_destroy: true
  accepts_nested_attributes_for :exams, allow_destroy: true

  after_save :set_handle


  def set_handle
    handle_patient_visits.create(user_id: User.current.id, visit_id: self.id)
  end

end
