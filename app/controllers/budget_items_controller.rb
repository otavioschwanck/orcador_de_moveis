class BudgetItemsController < ApplicationController
  before_action :set_budget_item, only: [:show, :edit, :update, :destroy]
  before_action do 
    set_client
    set_budget
    set_mobile
  end

   # GET /budget_items/1
  # GET /budget_items/1.json
  def show
  end

  # GET /budget_items/new
  def new
    @budget_item = @mobile.budget_items.build
  end

  # GET /budget_items/1/edit
  def edit
  end

  # POST /budget_items
  # POST /budget_items.json
  def create
    @budget_item = @mobile.budget_items.build(budget_item_params)

    respond_to do |format|
      if @budget_item.save
     
        format.html { redirect_to [@client, @budget, @mobile], notice: "Item adicionado com sucesso" }
        format.json { render :show, status: :created, location: @budget_item }
      else
        format.html { render :new }
        format.json { render json: @budget_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /budget_items/1
  # PATCH/PUT /budget_items/1.json
  def update
    respond_to do |format|
      if @budget_item.update(budget_item_params)
        format.html { redirect_to [@client, @budget, @mobile], notice: 'Item atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @budget_item }
      else
        format.html { render :edit }
        format.json { render json: @budget_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /budget_items/1
  # DELETE /budget_items/1.json
  def destroy
    @budget_item.destroy
    respond_to do |format|
      format.html { redirect_to client_budget_mobile_url(@client, @budget, @mobile), notice: "Item deletado com sucesso." }
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

    def set_budget_item
      @budget_item = BudgetItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def budget_item_params
      params.require(:budget_item).permit(:item_id, :qtd, :multiplicable, :mobile_id)
    end
end