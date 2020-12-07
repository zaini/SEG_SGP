class BankAccountsController < ApplicationController
  before_action :set_bank_account, only: [:show, :edit, :update, :destroy]
  
  def index
    @users = User.where(admin: current_user)
    @bank_accounts = BankAccount.where(user: @users)
  end

  def show
  end

  def new
    @users = User.where(admin: current_user)
    @bank_account = BankAccount.new
  end

  def create
    @bank_account = BankAccount.new(account_name: params[:bank_account][:account_name], account_number: params[:bank_account][:account_number], sort_code: params[:bank_account][:sort_code], interest_rate: params[:bank_account][:interest_rate])
    @bank_account.user = User.find(params[:bank_account][:user_id])

    if @bank_account.valid? && @bank_account.save
      redirect_to(bank_accounts_path)
    else
      render('new')
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @bank_account.update(account_name: params[:bank_account][:account_name], account_number: params[:bank_account][:account_number], sort_code: params[:bank_account][:sort_code])
        format.html { redirect_to bank_accounts_path(@bank_account), notice: 'Bank account was successfully updated.' }
      else
        format.html { render :edit, notice: 'Error!Bank account can not be updated.' }
      end
    end
  end

  def destroy
    @bank_account.destroy
    respond_to do |format|
     format.html { redirect_to bank_accounts_path(@bank_account), notice: 'Bank account was successfully destroyed.' }
   end
  end
  
  def statement
    @bank_account = BankAccount.find(params[:id])
  end

  def transfer
    @bank_account = BankAccount.find(params[:id])
  end

  def payment
    @bank_account = BankAccount.find(params[:id])
  end
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_bank_account
    @bank_account = BankAccount.find(params[:id])
  end
end
