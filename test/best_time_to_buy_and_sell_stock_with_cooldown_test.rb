require 'minitest/autorun'
require '../best_time_to_buy_and_sell_stock_with_cooldown'

describe 'max_profit(prices)' do
  it 'should pass given test case' do
    prices = [1, 2, 3, 0, 2]
    expected_result = 3
    max_profit(prices).must_equal(expected_result)
  end

  it 'should pass failed test case' do
    prices = [6,1,3,2,4,7]
    expected_result = 6
    max_profit(prices).must_equal(expected_result)

    prices = [2,1,4,5,2,9,7]
    expected_result = 10
    max_profit(prices).must_equal(expected_result)

    prices = [1,3,5,4,3,7,6,9,2,4]
    expected_result = 10
    max_profit(prices).must_equal(expected_result)

    prices = [8,6,4,3,3,2,3,5,8,3,8,2,6]
    expected_result = 10
    max_profit(prices).must_equal(expected_result)
    
  end

  it 'should pass corner case test case' do
    prices = [1]
    expected_result = 0
    max_profit(prices).must_equal(expected_result)

    prices = [1,2]
    expected_result = 1
    max_profit(prices).must_equal(expected_result)

    prices = [1,2,3]
    expected_result = 2
    max_profit(prices).must_equal(expected_result)

    prices = [1,3,2]
    expected_result = 2
    max_profit(prices).must_equal(expected_result)
  end

  it 'should pass new test case' do
    prices = [1,2,1,1,3]
    expected_result = 3
    max_profit(prices).must_equal(expected_result)
  end

  it 'should work1' do
    prices = [6,1,3,2,4,7]
    expected_result = 6
    max_profit(prices).must_equal(expected_result)
  end
end
