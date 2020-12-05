class TransactionsController < ApplicationController
  before_action :get_account
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]
  

  def index
    @transactions = @bank_account.transactions
  end
 
  def show
  end

  def new 
    @transaction = @bank_account.transactions.build
  end

  def create
    @transaction = @bank_account.transactions.build(transaction_params)
    
    respond_to do |format|
      if @transaction.valid? && @transaction.save
         format.html { redirect_to bank_account_transactions_path(@bank_account), notice: 'Transaction was successfully created.' }
      else
         format.html { render :new ,notice:'Error!'}
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @transaction.update(post_params)
        format.html { redirect_to bank_account_transactions_path(@bank_account), notice: 'Transaction was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
  
  def destroy
    @transaction.destroy
     respond_to do |format|
      format.html { redirect_to bank_account_transactions_path(@bank_account), notice: 'Transaction was successfully destroyed.' }
    end
  end


  private
  def transaction_params
    params.require(:transaction).permit(:date, :description, :reference, :money_in, :money_out)
  end
  
  def get_account
    @bank_account = BankAccount.find(params[:bank_account_id]) 
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_transaction
    @transaction = @bank_account.transactions.find(params[:id])
  end

end

