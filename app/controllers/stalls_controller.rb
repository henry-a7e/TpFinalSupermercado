class StallsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_stall, only: %i[ show edit update destroy ]
  
  # GET /stalls or /stalls.json
  def index
    @stalls = Stall.all

    @stalls = @stalls.where(["stall_name LIKE :filter", :filter => "%" + params[:filter] + "%"]) unless params[:filter].blank?

    @stalls = @stalls.order(:stall_name).page(params[:page] || 1)
  end

  # GET /stalls/1 or /stalls/1.json
  def show
  end

  # GET /stalls/new
  def new
    @stall = Stall.new
  end

  # GET /stalls/1/edit
  def edit
  end

  # POST /stalls or /stalls.json
  def create
    @stall = Stall.new(stall_params)

    respond_to do |format|
      if @stall.save
        format.html { redirect_to @stall, notice: "Stall was successfully created." }
        format.json { render :show, status: :created, location: @stall }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @stall.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stalls/1 or /stalls/1.json
  def update
    respond_to do |format|
      if @stall.update(stall_params)
        format.html { redirect_to @stall, notice: "Stall was successfully updated." }
        format.json { render :show, status: :ok, location: @stall }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @stall.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stalls/1 or /stalls/1.json
  def destroy
    @stall.destroy
    respond_to do |format|
      format.html { redirect_to stalls_url, notice: "Stall was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stall
      @stall = Stall.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def stall_params
      params.require(:stall).permit(:stall_name)
    end
end
