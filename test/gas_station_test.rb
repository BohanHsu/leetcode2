require 'minitest/autorun'
require '../gas_station'

describe 'can_complete_circuit(gas, cost)' do
  it 'should work1' do
    gas = [10,15,10,20,10,15,10,20]
    cost = [10,22,12,12,10,22,10,12]
    expected_result = 3
    can_complete_circuit(gas, cost).must_equal(expected_result)

    gas = [10,20,10,15,10,20,10,15]
    cost = [10,12,10,22,12,12,10,22]
    expected_result = 5
    can_complete_circuit(gas, cost).must_equal(expected_result)

    gas = [10,15,10,20,10,15,10,20]
    cost = [10,22,12,20,10,22,10,12]
    expected_result = -1
    can_complete_circuit(gas, cost).must_equal(expected_result)

    gas = [10]
    cost = [20]
    expected_result = -1
    can_complete_circuit(gas, cost).must_equal(expected_result)

    gas = [10]
    cost = [1]
    expected_result = 0
    can_complete_circuit(gas, cost).must_equal(expected_result)

    gas = [10]
    cost = [10]
    expected_result = 0
    can_complete_circuit(gas, cost).must_equal(expected_result)
  end

  it 'should work2' do
    gas = [6,1,4,3,5]
    cost = [3,8,2,4,2]
    expected_result = 2
    can_complete_circuit(gas, cost).must_equal(expected_result)
  end


  it 'should work3' do
    gas = [10,20,10,15,10,20,10,15]
    cost = [10,12,10,22,12,12,10,22]
    expected_result = 5
    can_complete_circuit(gas, cost).must_equal(expected_result)
  end
end
