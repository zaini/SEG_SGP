class BankAccountsController < ApplicationController
  before_action :set_bank_account, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
  
  # Get bank accounts according to user's id
  def index
    @users = User.where(admin: current_user)
    @bank_accounts = BankAccount.where(user: @users)
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

  def update
    respond_to do |format|
      if @bank_account.update(account_name: params[:bank_account][:account_name], account_number: params[:bank_account][:account_number], sort_code: params[:bank_account][:sort_code], interest_rate: params[:bank_account][:interest_rate])
        format.html { redirect_to bank_accounts_path(@bank_account), notice: 'Bank account was successfully updated.' }
      else
        format.html { render :edit, notice: 'Error! Bank account can not be updated.' }
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
    @user_bank_accounts = BankAccount.where(user: current_user)
    @bank_account = BankAccount.find(params[:id])
  end

  def transfer_money
    currency = Currency.find(current_user[:currency_id])
    @from_bank_account = BankAccount.find(params[:id])
    @to_bank_account = BankAccount.find(params[:bank_account_id])
    @description = "TRANSFER FROM " + [current_user[:first_name], current_user[:last_name], @from_bank_account[:account_name]].map(&:to_s).join(', ')
    @reference = "TRANSFER FROM " + [current_user[:first_name], current_user[:last_name], @from_bank_account[:account_name]].map(&:to_s).join(', ')
    @amount = params[:amount].to_f * currency[:rate_to_gbp]
    @time = Time.now

    @out = Transaction.new(bank_account: @from_bank_account, date: @time, description: @description, reference: @reference, money_in: 0, money_out: @amount)
    @in = Transaction.new(bank_account: @to_bank_account, date: @time, description: @description, reference: @reference, money_in: @amount, money_out: 0)

    if @out.valid? && @in.valid? && @out.save && @in.save
      redirect_to statement_bank_account_path(@from_bank_account)
    else
      redirect_to transfer_bank_account_path(@from_bank_account)
    end
  end

  def payment
    @bank_account = BankAccount.find(params[:id])
  end

  def send_payment
    currency = Currency.find(current_user[:currency_id])
    @from_bank_account = BankAccount.find(params[:id])
    @to_account_number = params[:account_number]
    @to_sort_code = params[:sort_code]
    @description = params[:description]
    @reference = params[:reference]
    @amount = params[:amount].to_f * currency[:rate_to_gbp]
    @time = Time.now

    @out = Transaction.new(bank_account: @from_bank_account, date: @time, description: @description, reference: @reference, money_in: 0, money_out: @amount)

    if @out.valid? && @out.save
      redirect_to statement_bank_account_path(@from_bank_account)
    else
      redirect_to transfer_bank_account_path(@from_bank_account)
    end
  end
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_bank_account
    @bank_account = BankAccount.find(params[:id])
  end
end
