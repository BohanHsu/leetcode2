require 'minitest/autorun'

# @param {Integer} n
# @return {Boolean}
def has_alternating_bits(n)
  last_bit = nil

  while n > 0 do
    cur_bit = n % 2
    if cur_bit == last_bit
      return false
    end

    last_bit = cur_bit
    n /= 2
  end

  return true
end

describe 'has_alternating_bits(n)' do
  it 'should work1' do
    n = 5
    expected_result = true
    has_alternating_bits(n).must_equal(expected_result)
    
    n = 7
    expected_result = false
    has_alternating_bits(n).must_equal(expected_result)
    
    n = 11
    expected_result = false
    has_alternating_bits(n).must_equal(expected_result)
    
    n = 10
    expected_result = true
    has_alternating_bits(n).must_equal(expected_result)

    n = 0
    expected_result = true
    has_alternating_bits(n).must_equal(expected_result)
  end
end
