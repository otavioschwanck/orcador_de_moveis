class BudgetsController < ApplicationController
  before_action :set_client
  before_action :set_budget, only: [:show, :edit, :update, :destroy]

  # GET /budgets
  # GET /budgets.json
  def index
    @budgets = @client.budgets.all.order(created_at: :desc).page(params[:page]).per(20)
  end

  # GET /budgets/1
  # GET /budgets/1.json
  def show
  end

  # GET /budgets/new
  def new
    @budget = @client.budgets.build
  end

  # GET /budgets/1/edit
  def edit
  end

  # POST /budgets
  # POST /budgets.json
  def create
    @budget = @client.budgets.build(budget_params)

    respond_to do |format|
      if @budget.save
        format.html { redirect_to [@client, @budget], notice: 'Orçamento criado com sucesso, vamos adicionar os itens?.' }
        format.json { render :show, status: :created, location: @budget }
      else
        format.html { render :new }
        format.json { render json: @budget.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /budgets/1
  # PATCH/PUT /budgets/1.json
  def update
    respond_to do |format|
      if @budget.update(budget_params)
        format.html { redirect_to @budget, notice: 'Orçamento atualizado com sucesso..' }
        format.json { render :show, status: :ok, location: @budget }
      else
        format.html { render :edit }
        format.json { render json: @budget.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /budgets/1
  # DELETE /budgets/1.json
  def destroy
    @budget.destroy
    respond_to do |format|
      format.html { redirect_to budgets_url, notice: 'Orçamento deletado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_client
      @client = current_user.clients.find(params[:client_id])
    end
    def set_budget
      @budget = Budget.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def budget_params
      params.require(:budget).permit(:description, :client_id)
    end
end
