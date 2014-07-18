class PatientMedicalConditionsController < ApplicationController
  before_action :set_patient

  # GET /patient_patient_medical_conditions
  # GET /patient_patient_medical_conditions.json
  def index
    @patient_medical_conditions = @patient.patient_medical_conditions
    if @patient_medical_conditions.blank?
      redirect_to new_patient_patient_medical_condition_path(@patient) and return
    end
  end

  # GET /patient_patient_medical_conditions/new
  def new
    build_resource
  end

  # GET /patient_patient_medical_conditions/1/edit
  def edit
    build_resource
  end

  # PATCH/PUT /patient_patient_medical_conditions/1
  # PATCH/PUT /patient_patient_medical_conditions/1.json
  def update
    respond_to do |format|
      if @patient.update(patient_medical_condition_params)
        format.html { redirect_to patient_patient_medical_conditions_path(@patient), notice: 'Patient medical condition was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @patient_medical_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def patient_medical_condition_params
    params.require(:patient).permit(:patient_medical_conditions_attributes => [:_destroy, :medical_condition_id, :family_affected, :patient_affected, :id])
  end


  def set_patient
    @patient = Patient.find(params[:patient_id])
  end

  def build_resource
    @patient_medical_conditions = MedicalCondition.all.collect do |mc|
      @patient.patient_medical_conditions.find_or_initialize_by(medical_condition_id: mc.id)
    end
  end

end
