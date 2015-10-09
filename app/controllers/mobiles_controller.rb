class MobilesController < ApplicationController
  before_action :set_client
  before_action :set_budget
  before_action :set_mobile, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!
  # GET /mobiles

  # GET /mobiles/1
  # GET /mobiles/1.json
  def show
  end

  # GET /mobiles/new
  def new
    @mobile = @budget.mobiles.build
  end

  # GET /mobiles/1/edit
  def edit
  end

  # POST /mobiles
  # POST /mobiles.json
  def create
    @mobile = @budget.mobiles.build(mobile_params)

    respond_to do |format|
      if @mobile.save
        format.html { redirect_to [@client, @budget, @mobile], notice: 'Mobile was successfully created.' }
        format.json { render :show, status: :created, location: @mobile }
      else
        format.html { render :new }
        format.json { render json: @mobile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mobiles/1
  # PATCH/PUT /mobiles/1.json
  def update
    respond_to do |format|
      if @mobile.update(mobile_params)
        format.html { redirect_to [@client, @budget, @mobile], notice: 'Mobile was successfully updated.' }
        format.json { render :show, status: :ok, location: @mobile }
      else
        format.html { render :edit }
        format.json { render json: @mobile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mobiles/1
  # DELETE /mobiles/1.json
  def destroy
    @mobile.destroy
    respond_to do |format|
      format.html { redirect_to client_budgets_url(@client), notice: 'Mobile was successfully destroyed.' }
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
      @mobile = Mobile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mobile_params
      params.require(:mobile).permit(:multiplier, :name, :description, :budget_id)
    end
end
