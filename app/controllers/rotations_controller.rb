class RotationsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_rotation, only: %i[ show edit update destroy ]

  # GET /rotations or /rotations.json
  def index
    @rotations = Rotation.all

    @rotations = @rotations.where(:head => params[:head]) unless params[:head].blank?

    @rotations = @rotations.where(:department_id => params[:department_id]) unless params[:department_id].blank?

    @rotations = @rotations.where(:stall_id => params[:stall_id]) unless params[:stall_id].blank?

    @rotations = @rotations.where(:branch_office_id => params[:branch_office_id]) unless params[:branch_office_id].blank?

    @rotations = @rotations.where(:branch_office_id => params[:branch_office_id]) unless params[:branch_office_id].blank?
    @rotations = @rotations.where(:department_id => params[:department_id]) unless params[:department_id].blank?
    @rotations = @rotations.where(:stall_id => params[:stall_id]) unless params[:stall_id].blank?
    @rotations = @rotations.where(:employee_id => params[:employee_id]) unless params[:employee_id].blank?
    
    @rotations = @rotations.order(:head).page(params[:page] || 1)
  end

  # GET /rotations/1 or /rotations/1.json
  def show
  end

  # GET /rotations/new
  def new
    @rotation = Rotation.new
  end

  # GET /rotations/1/edit
  def edit
  end

  # POST /rotations or /rotations.json
  def create
    @rotation = Rotation.new(rotation_params)

    respond_to do |format|
      if @rotation.save
        format.html { redirect_to @rotation, notice: "Rotation was successfully created." }
        format.json { render :show, status: :created, location: @rotation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @rotation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rotations/1 or /rotations/1.json
  def update
    respond_to do |format|
      if @rotation.update(rotation_params)
        format.html { redirect_to @rotation, notice: "Rotation was successfully updated." }
        format.json { render :show, status: :ok, location: @rotation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rotation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rotations/1 or /rotations/1.json
  def destroy
    @rotation.destroy
    respond_to do |format|
      format.html { redirect_to rotations_url, notice: "Rotation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rotation
      @rotation = Rotation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rotation_params
      params.require(:rotation).permit(:begins_at, :ends_at, :head, :branch_Office_id, :department_id, :stall_id, :employee_id)
    end
end
