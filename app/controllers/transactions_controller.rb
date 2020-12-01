class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.order(:id)
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def new
    @transaction = Transaction.new
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
  def transaction_params
    params.require(:transaction).permit(:baid, :date, :description, :reference, :money_in, :money_out)
  end
end
