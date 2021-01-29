class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  respond_to :html, :xml, :json

  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.all
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
  end

  # GET /accounts/new
  def new
    @account = Account.new
    @title_page = t('helpers.create')
    respond_modal_with @account
  end

  # GET /accounts/1/edit
  def edit
    @title_page = t('helpers.edit')
    respond_modal_with @account
  end

  # POST /accounts
  # POST /accounts.json
  def create
    formatValuesToSave(*account_params.values_at(:balance))
    @account = Account.new(account_params)

    if @account.save
      respond_modal_with @account, location: accounts_path
    else
      respond_modal_with @account
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    formatValuesToSave(*account_params.values_at(:balance))
    if @account.update(account_params)
      respond_modal_with @account, location: accounts_path
    else
      respond_modal_with @account
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: t('messages.destroy_success') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def account_params
      params.require(:account).permit(:description, :balance, :active)
    end
end
