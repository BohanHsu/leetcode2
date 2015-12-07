require 'minitest/autorun'
require '../best_time_to_buy_and_sell_stock_iii'

describe 'max_profit(prices)' do
  it 'should help development' do
    prices = [1,3,5,2,3,4,5,7]
    expected_result = 9
    max_profit(prices).must_equal(expected_result)
  end

  it 'should pass general test case' do
    prices = [1,3,5,2]
    expected_result = 4
    max_profit(prices).must_equal(expected_result)

    prices = [1,3,5,7]
    expected_result = 6
    max_profit(prices).must_equal(expected_result)

    prices = [1,3,5,7, 5, 3, 1]
    expected_result = 6
    max_profit(prices).must_equal(expected_result)

    prices = [1,3,5,7, 5, 3, 1, 5]
    expected_result = 10
    max_profit(prices).must_equal(expected_result)
  end

  it 'should pass corner case' do
    prices = []
    expected_result = 0
    max_profit(prices).must_equal(expected_result)

    prices = [1]
    expected_result = 0
    max_profit(prices).must_equal(expected_result)

    prices = [2, 1]
    expected_result = 0
    max_profit(prices).must_equal(expected_result)
  end

  it 'should pass failed test case' do
    prices = [1, 2]
    expected_result = 1
    max_profit(prices).must_equal(expected_result)

    prices = [3,3,5,0,0,3,1,4]
    expected_result = 6 
    max_profit(prices).must_equal(expected_result)
    
  end
end
