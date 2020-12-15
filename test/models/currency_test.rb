require 'test_helper'

class CurrencyTest < ActiveSupport::TestCase

#:code, :symbol, :rate_to_gbp

  test "validate currency with all variables present" do
    currency = Currency.new(symbol:"FOO", code:"BAR", rate_to_gbp:1.1)
    assert currency.valid?, "Currency with all variable present should be validated "
  end

  test "should not validate empty currency" do
    currency = Currency.new
    assert !currency.valid?, "Validated Empty Currency"
  end

  test "should not validate currency without rate to gbp" do
    currency = Currency.new(code:"FOO", symbol:"BAR")
    assert !currency.valid?, "Validated Currency without rate to gbp"
  end

  test "should not validate currency without symbol" do
    currency = Currency.new(code:"FOO", rate_to_gbp:1.1)
    assert !currency.valid?, "Validated Currency without symbol"
  end

  test "should not validate currency without code" do
    currency = Currency.new(symbol:"FOO", rate_to_gbp:1.1)
    assert !currency.valid?, "Validated Currency without code"
  end

  test "should not create two currencies with same code" do
    currency1 = Currency.new(symbol:"FOO", code:"BAR", rate_to_gbp:1.1)
    currency1.save
    currency2 = Currency.new(symbol:"ABC", code:"BAR", rate_to_gbp:1.1)
    assert_not currency2.save, "Saved 2 currency with same code"
  end

  test "should not create two currencies with same symbol" do
    currency1 = Currency.new(symbol:"FOO", code:"BAR", rate_to_gbp:1.1)
    currency1.save
    currency2 = Currency.new(symbol:"FOO", code:"ABC", rate_to_gbp:1.1)
    assert_not currency2.save, "Saved 2 currency with same symbol"
  end

end
