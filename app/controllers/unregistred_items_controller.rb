class UnregistredItemsController < ApplicationController
    before_action :authenticate_user!
  before_action do 
    set_client
    set_budget
    set_mobile
  end
  before_action :set_unregistred_item, only: [:show, :edit, :update, :destroy]

  def new
    @unregistred_item = @mobile.unregistred_items.build
  end

  # GET /unregistred_items/1/edit
  def edit
  end

  # POST /unregistred_items
  # POST /unregistred_items.json
  def create
    @unregistred_item = @mobile.unregistred_items.build(unregistred_item_params)

    respond_to do |format|
      if @unregistred_item.save

        format.html { redirect_to [@client, @budget, @mobile], notice: "Item adicionada com sucesso" }
        format.json { render :show, status: :created, location: @unregistred_item }
      else
        format.html { render :new }
        format.json { render json: @unregistred_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /unregistred_items/1
  # PATCH/PUT /unregistred_items/1.json
  def update
    respond_to do |format|
      if @unregistred_item.update(unregistred_item_params)
        format.html { redirect_to [@client, @budget, @mobile], notice: 'Item atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @unregistred_item }
      else
        format.html { render :edit }
        format.json { render json: @unregistred_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unregistred_items/1
  # DELETE /unregistred_items/1.json
  def destroy
    @unregistred_item.destroy
    respond_to do |format|
      format.html { redirect_to client_budget_mobile_url(@client, @budget, @mobile), notice: "Item deletado com sucesso." }
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
    def set_unregistred_item
      @unregistred_item = UnregistredItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unregistred_item_params
      params.require(:unregistred_item).permit(:multiplicable, :description, :value, :qtd, :mobile_id)
    end
end
