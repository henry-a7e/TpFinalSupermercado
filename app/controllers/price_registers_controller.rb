class PriceRegistersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_price_register, only: %i[ show edit update destroy ]

  # GET /price_registers or /price_registers.json
  def index
    @price_registers = PriceRegister.all
    @price_registers = @price_registers.order(:price).page(params[:page] || 1)
  end

  # GET /price_registers/1 or /price_registers/1.json
  def show
  end

  # GET /price_registers/new
  def new
    @price_register = PriceRegister.new
  end

  # GET /price_registers/1/edit
  def edit
  end

  # POST /price_registers or /price_registers.json
  def create
    @price_register = PriceRegister.new(price_register_params)

    respond_to do |format|
      if @price_register.save
        format.html { redirect_to @price_register, notice: "Price register was successfully created." }
        format.json { render :show, status: :created, location: @price_register }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @price_register.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /price_registers/1 or /price_registers/1.json
  def update
    respond_to do |format|
      if @price_register.update(price_register_params)
        format.html { redirect_to @price_register, notice: "Price register was successfully updated." }
        format.json { render :show, status: :ok, location: @price_register }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @price_register.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /price_registers/1 or /price_registers/1.json
  def destroy
    @price_register.destroy
    respond_to do |format|
      format.html { redirect_to price_registers_url, notice: "Price register was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_price_register
      @price_register = PriceRegister.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def price_register_params
      params.require(:price_register).permit(:price, :begin_at, :ends_at, :product_id)
    end
end
