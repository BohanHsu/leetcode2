require 'minitest/autorun'
require '../coin_change'

describe 'coin_change(coins, amount)' do
  it 'should work1' do
    coins = [1,2,5]
    amount = 11
    expected_result = 3
    coin_change(coins, amount).must_equal(expected_result)

    coins = [2]
    amount = 3
    expected_result = -1
    coin_change(coins, amount).must_equal(expected_result)
  end

  it 'should work2' do
    coins = [3,7,405,436]
    amount = 8839
    expected_result = 25
    coin_change(coins, amount).must_equal(expected_result)

    coins = [186,419,83,408]
    amount = 6249
    expected_result = 20
    coin_change(coins, amount).must_equal(expected_result)

    coins = [46,295,485,415,449,379,183,323]
    amount = 5897
    expected_result = 13
    coin_change(coins, amount).must_equal(expected_result)
  end
end
