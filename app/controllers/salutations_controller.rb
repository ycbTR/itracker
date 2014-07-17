class SalutationsController < ApplicationController
  before_action :set_salutation, only: [:show, :edit, :update, :destroy]

  # GET /salutations
  # GET /salutations.json
  def index
    @salutations = Salutation.all
  end

  # GET /salutations/1
  # GET /salutations/1.json
  def show
  end

  # GET /salutations/new
  def new
    @salutation = Salutation.new
  end

  # GET /salutations/1/edit
  def edit
  end

  # POST /salutations
  # POST /salutations.json
  def create
    @salutation = Salutation.new(salutation_params)

    respond_to do |format|
      if @salutation.save
        format.html { redirect_to @salutation, notice: 'Salutation was successfully created.' }
        format.json { render action: 'show', status: :created, location: @salutation }
      else
        format.html { render action: 'new' }
        format.json { render json: @salutation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /salutations/1
  # PATCH/PUT /salutations/1.json
  def update
    respond_to do |format|
      if @salutation.update(salutation_params)
        format.html { redirect_to @salutation, notice: 'Salutation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @salutation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /salutations/1
  # DELETE /salutations/1.json
  def destroy
    @salutation.destroy
    respond_to do |format|
      format.html { redirect_to salutations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_salutation
      @salutation = Salutation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def salutation_params
      params.require(:salutation).permit(:name)
    end
end
