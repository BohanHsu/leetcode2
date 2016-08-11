require 'minitest/autorun'
require '../scramble_string'

describe 'is_scramble(s1, s2)' do
  it 'should work1' do
    s1 = "great"
    s2 = "rgtae"
    expected_result = true
    is_scramble(s1, s2).must_equal(expected_result)
  end

  it 'should work2' do
    s1 = "great"
    s2 = "gtrae"
    expected_result = false
    is_scramble(s1, s2).must_equal(expected_result)
  end
end
