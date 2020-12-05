class BankAccountsController < ApplicationController
  def index
    @users = User.where(admin: current_user)
    @bank_accounts = BankAccount.where(user: @users)
  end

  def show
    @bank_account = BankAccount.find(params[:id])
  end

  def new
    @users = User.where(admin: current_user)
    @bank_account = BankAccount.new
  end

  def create
    @bank_account = BankAccount.new(account_name: params[:bank_account][:account_name], account_number: params[:bank_account][:account_number], sort_code: params[:bank_account][:sort_code])
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
  end

  def delete
  end

  def destroy
  end
end
