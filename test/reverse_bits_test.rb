require 'minitest/autorun'
require '../reverse_bits'

describe 'reverse_bits(n)' do
  it 'should work1' do
    n = 43261596
    expected_result = 964176192
    reverse_bits(n).must_equal(expected_result)
  end
end
