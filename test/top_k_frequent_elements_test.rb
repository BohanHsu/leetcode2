require 'minitest/autorun'
require '../top_k_frequent_elements'

describe 'top_k_frequent(nums, k)' do
  it 'should work1' do
    nums = [1,1,1,2,2,3]
    k = 2
    expected_result = [1,2]
    top_k_frequent(nums, k).must_equal(expected_result)
  end
end
