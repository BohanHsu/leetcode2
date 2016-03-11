require 'minitest/autorun'
require '../create_maximum_number'

describe 'max_n_number(nums, n)' do
  it 'should work1' do
    nums = [1,2,3,4]
    n = 3
    expected_result = [2,3,4]
    max_n_number(nums, n).must_equal(expected_result)

    nums = [1,2,3,4]
    n = 2
    expected_result = [3,4]
    max_n_number(nums, n).must_equal(expected_result)

    nums = [4,3,2,1]
    n = 3
    expected_result = [4,3,2]
    max_n_number(nums, n).must_equal(expected_result)
  end
end

describe 'merge(nums1, nums2)' do
  it 'should work1' do
    nums1 = [9,8,7]
    nums2 = [8,7,6]
    expected_result = [9,8,8,7,7,6]
    merge(nums1, nums2).must_equal(expected_result)

    nums1 = [9,8,7,9,8,7]
    nums2 = [9,8,7]
    expected_result = [9,9,8,8,7,9,8,7,7]
    merge(nums1, nums2).must_equal(expected_result)

    nums1 = [9,8,7,9,8]
    nums2 = [9,8,7]
    expected_result = [9,9,8,8,7,9,8,7]
    merge(nums1, nums2).must_equal(expected_result)

    nums1 = [1,2,3,1,2]
    nums2 = [1,2,3]
    expected_result = [1,2,3,1,2,3,1,2]
    merge(nums1, nums2).must_equal(expected_result)
  end
end

describe 'compare(nums1, nums2)' do
  it 'should work1' do
    nums1 = [1,2,3,1,2]
    nums2 = [1,2,3]
    expected_result = 1
    compare(nums1, nums2).must_equal(expected_result)

    nums1 = [9,8,7,9,8]
    nums2 = [9,8,7]
    expected_result = -1
    compare(nums1, nums2).must_equal(expected_result)
  end
end
