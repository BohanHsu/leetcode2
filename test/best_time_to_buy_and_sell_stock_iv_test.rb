require 'minitest/autorun'
require '../best_time_to_buy_and_sell_stock_iv'

describe 'max_profit(k, prices)' do
  it 'pass general test' do
    prices = [1,2,3,4,5,6,7]
    k = 2
    expect_result = 6
    max_profit(k, prices).must_equal(expect_result)

    prices = [1,2,1,2,1,2]
    k = 1
    expect_result = 1
    max_profit(k, prices).must_equal(expect_result)

    prices = [1,2,1,2,1,2]
    k = 2
    expect_result = 2
    max_profit(k, prices).must_equal(expect_result)

    prices = [1,2,1,2,1,2]
    k = 3
    expect_result = 3
    max_profit(k, prices).must_equal(expect_result)

    prices = [1,2,1,2,1,2]
    k = 100
    expect_result = 3
    max_profit(k, prices).must_equal(expect_result)

    prices = [8,7,6,5,4]
    k = 2
    expect_result = 0
    max_profit(k, prices).must_equal(expect_result)

    prices = [8,7,6,5,4]
    k = 3
    expect_result = 0
    max_profit(k, prices).must_equal(expect_result)
  end

  it 'should pass corner case' do
    prices = [4]
    k = 0
    expect_result = 0
    max_profit(k, prices).must_equal(expect_result)

    prices = [4,3,2,1]
    k = 1
    expect_result = 0
    max_profit(k, prices).must_equal(expect_result)

    prices = [4,3,2,1]
    k = 2
    expect_result = 0
    max_profit(k, prices).must_equal(expect_result)

    prices = [4,5,6,7,8]
    k = 0
    expect_result = 0
    max_profit(k, prices).must_equal(expect_result)
  end
end
