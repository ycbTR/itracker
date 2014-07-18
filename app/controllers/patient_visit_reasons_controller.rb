class PatientVisitReasonsController < ApplicationController
  before_action :set_patient
  before_action :set_visit

  # GET /patient_visit_reasons
  # GET /patient_visit_reasons.json
  def index
    @patient_visit_reasons = @visit.patient_visit_reasons
    if @patient_visit_reasons.blank?
      redirect_to new_patient_visit_patient_visit_reason_path(@patient, @visit) and return
    end
  end

  # GET /patient_visit_reasons/1
  # GET /patient_visit_reasons/1.json
  def show
  end

  # GET /patient_visit_reasons/new
  def new
    build_reasons
  end

  # GET /patient_visit_reasons/1/edit
  def edit
    build_reasons
  end

  # PATCH/PUT /patient_visit_reasons/1
  # PATCH/PUT /patient_visit_reasons/1.json
  def update
    respond_to do |format|
      if @visit.update(patient_visit_reason_params)
        format.html { redirect_to patient_visit_patient_visit_reasons_path(@patient, @visit), notice: 'Patient visit reason was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @patient_visit_reason.errors, status: :unprocessable_entity }
      end
    end
  end


  private


  # Never trust parameters from the scary internet, only allow the white list through.
  def patient_visit_reason_params
    params.require(:visit).permit(:patient_visit_reasons_attributes => [:_destroy, :reason_id, :id])
  end


  def set_patient
    @patient = Patient.find(params[:patient_id])
  end

  def set_visit
    @visit = @patient.visits.find(params[:visit_id])
  end

  def build_reasons
    @reasons = Reason.all.collect do |reason|
      @visit.patient_visit_reasons.find_or_initialize_by(reason_id: reason.id)
    end
  end

end
