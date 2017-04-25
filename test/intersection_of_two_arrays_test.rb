require 'minitest/autorun'
require '../intersection_of_two_arrays'

describe 'intersection(nums1, nums2)' do
  it 'should work1' do
    nums1 = [1, 2, 2, 1]
    nums2 = [2, 2]
    expected_result = [2]

    intersection(nums1, nums2).sort.must_equal(expected_result.sort)
  end
end
