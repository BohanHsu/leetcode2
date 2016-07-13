require 'minitest/autorun'
require '../palindrome_partitioning_ii'

describe 'min_cut(s)' do
  it 'should work1' do
    s = 'aab'
    expected_result = 1
    min_cut(s).must_equal(expected_result)

    s = "abcccb"
    expected_result = 1
    min_cut(s).must_equal(expected_result)
  end
end
