require 'minitest/autorun'
require '../patching_array'

describe 'min_patches(nums, n)' do
  it 'should work1' do
    nums = [1,5, 20]
    n = 20
    expected_result = 2
    min_patches(nums, n).must_equal(expected_result)
  end
end
