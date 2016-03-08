require 'minitest/autorun'
require '../power_of_three'

describe 'is_power_of_three(n)' do
  it 'should work1' do
    is_power_of_three(1).must_equal(true)
    is_power_of_three(2).must_equal(false)
    is_power_of_three(3).must_equal(true)
    is_power_of_three(9).must_equal(true)
    is_power_of_three(119).must_equal(false)
  end
end
