class BankAccountsController < ApplicationController
  def index
    @bank_account = BankAccount.order(:id)
  end

  def show
    @bank_account = BankAccount.find(params[:id])
  end

  def new
    @bank_account = BankAccount.new
  end

  def create
    # @transaction = Transaction.new(transaction_params)
    # if @transaction.valid? && @transaction.save
    #   redirect_to(transactions_path)
    # else
    #   render('new')
    # end
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
  # def transaction_params
  #   params.require(:transaction).permit(:bank_account, :date, :description, :reference, :money_in, :money_out)
  # end
end
