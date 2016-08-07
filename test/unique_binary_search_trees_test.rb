require 'minitest/autorun'
require '../unique_binary_search_trees'

describe 'num_trees(n)' do
  it 'should work1' do
    n = 0
    expected_result = 1
    num_trees(n).must_equal(expected_result)

    n = 1
    expected_result = 1
    num_trees(n).must_equal(expected_result)

    n = 2
    expected_result = 2
    num_trees(n).must_equal(expected_result)

    n = 3
    expected_result = 5
    num_trees(n).must_equal(expected_result)
  end
end
