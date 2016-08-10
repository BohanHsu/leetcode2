require 'minitest/autorun'
require '../merge_sorted_array'

describe 'merge(nums1, m, nums2, n)' do
  it 'should work1' do
    nums2 = [3,34,23,43,52].sort
    nums1 = [1,2,3,4,5,34,145].sort
    m = nums1.length
    n = nums2.length
    nums3 = nums1 + nums2.map {nil}
    merge(nums3, m, nums2, n)
    nums3.must_equal((nums1 + nums2).sort)
  end
end
