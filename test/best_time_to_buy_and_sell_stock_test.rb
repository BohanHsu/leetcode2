require 'minitest/autorun'
require '../best_time_to_buy_and_sell_stock'

describe 'max_profit(prices)' do
  it 'should pass general test case' do
    prices = [1, 2]
    expected_result = 1
    max_profit(prices).must_equal(expected_result)

    prices = [3, 2]
    expected_result = 0
    max_profit(prices).must_equal(expected_result)

    prices = [1,2,3,0,5,6,7]
    expected_result = 7
    max_profit(prices).must_equal(expected_result)
  end

  it 'should pass corner test case' do
    prices = []
    expected_result = 0
    max_profit(prices).must_equal(expected_result)

    prices = [1]
    expected_result = 0
    max_profit(prices).must_equal(expected_result)
  end
end
