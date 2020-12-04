class BankAccountsController < ApplicationController
  def index
    @bank_accounts = BankAccount.where(user: current_user)
  end

  def show
    @bank_account = BankAccount.find(params[:id])
  end

  def new
    @bank_account = BankAccount.new
  end

  def create
    @bankuser = bankUser
    @bank_account = BankAccount.new(bank_account_params)
    @bank_account.user = @bankuser

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

  private
  def bank_account_params
    params.require(:bank_account).permit(:account_name, :account_number, :sort_code)
  end
end
