class AddSymbolToCurrencies < ActiveRecord::Migration[6.0]
  def change
    add_column :currencies, :symbol, :string
  end
end
