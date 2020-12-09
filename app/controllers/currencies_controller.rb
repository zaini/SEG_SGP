class CurrenciesController < ApplicationController
  before_action :redirect_to_root_if_not_logged_in_as_admin

  def index
    @currencies = Currency.all
  end

  def show
    @currency = Currency.find(params[:id])
  end

  def new
    @currency = Currency.new
  end

  def create
    @currency = Currency.new(currency_params)
    if @currency.valid? && @currency.save
      redirect_to(currencies_path)
    else
      render('new')
    end
  end

  def edit
    @currency = Currencies.find(params[:id])
  end

  def update
    @currency = Currency.find(params[:id])
    if @currency.update(currency_params)
      redirect_to(currency_path(@currency))
    else
      render('edit')
    end
  end

  def delete
    @currency = Currency.find(params[:id])
  end

  def destroy
    @currency = Currency.find(params[:id])
    @currency.destroy
    redirect_to(currencies_path)
  end

  private
    def currency_params
      params.require(:currency).permit(:code, :symbol, :rate_to_gbp)
    end

    def redirect_to_root_if_not_logged_in_as_admin
      unless logged_in? && is_admin?
        redirect_to(root_path)
      end
    end
end
