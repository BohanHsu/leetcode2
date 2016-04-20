require 'minitest/autorun'
require '../power_of_two'

describe 'is_power_of_two(n)' do
  it 'should work' do
    (-1000...100000).each do |i|
      expected_result = brutal_force(i)
      actual_result = brutal_force(i)
      actual_result.must_equal(expected_result)
    end
  end
end

def brutal_force(n)
  return false if n <= 0

  while n % 2 == 0 do
    n /= 2
  end

  return n == 1
end
