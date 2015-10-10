class DrawersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_drawer, only: [:show, :edit, :update, :destroy]
  before_action do 
    set_client
    set_budget
    set_mobile
  end
   # GET /drawers/1
  # GET /drawers/1.json
  def show
  end

  # GET /drawers/new
  def new
    @drawer = @mobile.drawers.build
  end

  # GET /drawers/1/edit
  def edit
  end

  # POST /drawers
  # POST /drawers.json
  def create
    @drawer = @mobile.drawers.build(drawer_params)
    respond_to do |format|
      if @drawer.save
        format.html { redirect_to [@client, @budget, @mobile], notice: "Gaveta adicionada com sucesso" }
        format.json { render :show, status: :created, location: @drawer }
      else
        format.html { render :new }
        format.json { render json: @drawer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drawers/1
  # PATCH/PUT /drawers/1.json
  def update
    respond_to do |format|
      if @drawer.update(drawer_params)
        format.html { redirect_to [@client, @budget, @mobile], notice: 'Gaveta atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @drawer }
      else
        format.html { render :edit }
        format.json { render json: @drawer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drawers/1
  # DELETE /drawers/1.json
  def destroy
    @drawer.destroy
    respond_to do |format|
      format.html { redirect_to client_budget_mobile_url(@client, @budget, @mobile), notice: "Gaveta deletada com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

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

    def set_drawer
      @drawer = Drawer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def drawer_params
      params.require(:drawer).permit(:description, :width, :height, :depth, :back_plate, :front_plate, :internal, :slide, :qtd, :mobile_id)
    end
end
