require 'minitest/autorun'
require '../factorial_trailing_zeroes'

describe 'trailing_zeroes(n)' do
  it 'should work1' do
    n = 100
    trailing_zeroes(n).must_equal(brutal_force(n))

    n = 102
    trailing_zeroes(n).must_equal(brutal_force(n))
  end
end

def brutal_force(n)
  # NOTE: this should be very damn slow
  sum = 1
  count = 0
  (1..n).each do |i|
    sum *= i
    while sum % 10 == 0 do
      sum /= 10
      count += 1
    end
  end
  count
end
