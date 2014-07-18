class VisitsController < ApplicationController
  before_action :set_patient
  before_action :set_visit, only: [:show, :edit, :update, :destroy, :exams, :exam]

  # GET /visits
  # GET /visits.json
  def index
    @visits = @patient.visits
    if @visits.blank?
      redirect_to new_patient_visit_path(@patient) and return
    end
  end

  # GET /visits/1
  # GET /visits/1.json
  def show
  end


  def exams
    @exams = @visit.exams
  end

  def exam
    @exam = @visit.exams.find(params[:exam_id])
    if request.delete?
      @exam.destroy
      flash[:success] = "Successfully deleted."
      redirect_to exams_patient_visit_path(@patient, @visit) and return
    end
  end

  # GET /visits/new
  def new
    @visit = @patient.visits.new
  end

  # GET /visits/1/edit
  def edit
  end

  # POST /visits
  # POST /visits.json
  def create
    @visit = @patient.visits.new(visit_params)

    respond_to do |format|
      if @visit.save
        format.html { redirect_to [@patient, @visit], notice: 'Visit was successfully created.' }
        format.json { render action: 'show', status: :created, location: @visit }
      else
        format.html { render action: 'new' }
        format.json { render json: @visit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /visits/1
  # PATCH/PUT /visits/1.json
  def update
    respond_to do |format|
      if @visit.update(visit_params)
        format.html { redirect_to location_after_save, notice: 'Visit was successfully updated.' }
        format.json { head :no_content }
      else
        if visit_params[:exams_attributes].present?
          flash[:error] = 'Attachment is invalid.'
          format.html { redirect_to location_after_save }
        else
          format.html { render action: 'edit' }
        end
        format.json { render json: @visit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visits/1
  # DELETE /visits/1.json
  def destroy
    @visit.destroy
    respond_to do |format|
      format.html { redirect_to patient_visits_url(@patient) }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_patient
    @patient = Patient.find(params[:patient_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_visit
    @visit = @patient.visits.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def visit_params
    params.require(:visit).permit(:date_visit, :length_since_last_visit, :lens_use_per_day,
                                  :lens_first_use, :dilation_consent, :privacy_consent, :test_result, :patient_id,
                                  :current_meds, :med_allergy, :med_allergy_list,
                                  :exams_attributes => [:id, :_destroy, :viewable_id, :viewable_type, :attachment])
  end

  def location_after_save
    if visit_params[:exams_attributes].present?
      exams_patient_visit_path(@patient, @visit)
    else
      [@patient, @visit]
    end
  end


end
