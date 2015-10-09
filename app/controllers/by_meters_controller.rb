class ByMetersController < ApplicationController
  before_action :set_by_meter, only: [:show, :edit, :update, :destroy]
  before_action do 
    set_client
    set_budget
    set_mobile
  end


  # GET /by_meters/1
  # GET /by_meters/1.json
  def show
  end

  # GET /by_meters/new
  def new
    @by_meter = @mobile.by_meters.build
  end

  # GET /by_meters/1/edit
  def edit
  end

  # POST /by_meters
  # POST /by_meters.json
  def create
    @by_meter = @mobile.by_meters.build(by_meter_params)

    respond_to do |format|
      if @by_meter.save
        session[:meter_price] = @by_meter.meter_price
        format.html { redirect_to [@client, @budget, @mobile], notice: "Móvel por metro adicionada com sucesso" }
        format.json { render :show, status: :created, location: @by_meter }
      else
        format.html { render :new }
        format.json { render json: @by_meter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /by_meters/1
  # PATCH/PUT /by_meters/1.json
  def update
    respond_to do |format|
      if @by_meter.update(by_meter_params)
        format.html { redirect_to [@client, @budget, @mobile], notice: 'Móvel por metro atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @by_meter }
      else
        format.html { render :edit }
        format.json { render json: @by_meter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /by_meters/1
  # DELETE /by_meters/1.json
  def destroy
    @by_meter.destroy
    respond_to do |format|
      format.html { redirect_to client_budget_mobile_url(@client, @budget, @mobile), notice: "Móvel por metro deletada com sucesso." }
      format.json { head :no_content }
    end
  end



  private

    def set_client
      @client = current_user.clients.find(params[:client_id])
    end

    def set_budget
      @budget = @client.budgets.find(params[:budget_id])
    end

    def set_mobile
      @mobile = @budget.mobiles.find(params[:mobile_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_by_meter
      @by_meter = ByMeter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def by_meter_params
      params.require(:by_meter).permit(:width, :height, :meter_price, :qtd, :multiplicable)
    end
end
