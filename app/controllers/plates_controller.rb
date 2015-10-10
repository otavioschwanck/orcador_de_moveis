class PlatesController < ApplicationController
  before_action :authenticate_user!
  before_action do 
    set_client
    set_budget
    set_mobile
  end
  before_action :set_plate, only: [:show, :edit, :update, :destroy]


  # GET /plates/1
  # GET /plates/1.json
  def show
  end

  # GET /plates/new
  def new
    @plate = @mobile.plates.build
  end

  # GET /plates/1/edit
  def edit
  end

  # POST /plates
  # POST /plates.json
  def create
    @plate = @mobile.plates.build(plate_params)

    respond_to do |format|
      if @plate.save
        session[:plate_value] = @plate.plate_value
        format.html { redirect_to [@client, @budget, @mobile], notice: "Chapa adicionada com sucesso" }
        format.json { render :show, status: :created, location: @plate }
      else
        format.html { render :new }
        format.json { render json: @plate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plates/1
  # PATCH/PUT /plates/1.json
  def update
    respond_to do |format|
      if @plate.update(plate_params)
        format.html { redirect_to [@client, @budget, @mobile], notice: 'Chapa atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @plate }
      else
        format.html { render :edit }
        format.json { render json: @plate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plates/1
  # DELETE /plates/1.json
  def destroy
    @plate.destroy
    respond_to do |format|
      format.html { redirect_to client_budget_mobile_url(@client, @budget, @mobile), notice: "Chapa deletada com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_client
      @client = current_user.clients.find(params[:client_id])
    end

    def set_budget
      @budget = @client.budgets.find(params[:budget_id])
    end

    def set_mobile
      @mobile = @budget.mobiles.find(params[:mobile_id])
    end

    def set_plate
      @plate = Plate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plate_params
      params.require(:plate).permit(:width, :height, :plate_value, :qtd, :mobile_id)
    end
end
