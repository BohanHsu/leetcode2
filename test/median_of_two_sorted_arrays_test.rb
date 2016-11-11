require 'minitest/autorun'
require '../median_of_two_sorted_arrays'

describe 'find_median_sorted_arrays(nums1, nums2)' do
  it 'should work1' do
    nums1 = [1,3,5,10,20,70]
    nums2 = [6,7,8,9,10,11,12,13,21,31,32,32,34]
    real_median = brutal_force(nums1, nums2)
    find_median_sorted_arrays(nums1, nums2).must_equal(real_median)


    nums1 = [1,3,5,10,20,70]
    nums2 = [6,7,8,9,10,11,12,13,21,31,32,32,34]
    real_median = brutal_force(nums1, nums2)
    find_median_sorted_arrays(nums1, nums2).must_equal(real_median)

    nums1 = [1,3,5]
    nums2 = [1,3,5]
    real_median = brutal_force(nums1, nums2)
    find_median_sorted_arrays(nums1, nums2).must_equal(real_median)


    nums1 = [1]
    nums2 = [1]
    real_median = brutal_force(nums1, nums2)
    find_median_sorted_arrays(nums1, nums2).must_equal(real_median)

    nums1 = [1,2,4]
    nums2 = [1]
    real_median = brutal_force(nums1, nums2)
    find_median_sorted_arrays(nums1, nums2).must_equal(real_median)

    nums1 = [1,2,3,4]
    nums2 = []
    real_median = brutal_force(nums1, nums2)
    find_median_sorted_arrays(nums1, nums2).must_equal(real_median)

    nums1 = [1,2,3]
    nums2 = []
    real_median = brutal_force(nums1, nums2)
    find_median_sorted_arrays(nums1, nums2).must_equal(real_median)

    nums2 = [1,2,3,4]
    nums1 = []
    real_median = brutal_force(nums1, nums2)
    find_median_sorted_arrays(nums1, nums2).must_equal(real_median)

    nums2= [1,2,3]
    nums1 = []
    real_median = brutal_force(nums1, nums2)
    find_median_sorted_arrays(nums1, nums2).must_equal(real_median)

    nums1=[331]
    nums2=[12, 67, 75, 96, 99, 115, 121, 151, 170, 188, 216, 266, 296, 326, 339, 383, 390, 426, 466, 474, 478, 480, 488, 488, 499, 525, 562, 654, 686, 694, 704, 708, 740, 755, 797, 814, 834, 844, 889, 903, 952, 970]

    real_median = brutal_force(nums1, nums2)
    find_median_sorted_arrays(nums1, nums2).must_equal(real_median)
  end

  it 'should work2' do
    nums1=[17, 21, 525, 526, 557, 578, 608, 634, 639, 731, 747, 765, 766, 860, 892, 914, 931]
    nums2=[248]
    real_median = brutal_force(nums1, nums2)
    find_median_sorted_arrays(nums1, nums2).must_equal(real_median)
  end

  it 'should work3' do
    10000.times do
      len1 = Random.rand(50)
      len2 = Random.rand(50)
      nums1 = len1.times.map do
        Random.rand(1000)
      end.sort
      nums2 = len2.times.map do
        Random.rand(1000)
      end.sort

      if nums1.empty? && nums2.empty?
        next
      end

      real_median = brutal_force(nums1, nums2)
      find_median_sorted_arrays(nums1, nums2).must_equal(real_median)
    end
  end
end

def brutal_force(nums1, nums2)
  nums = (nums1 + nums2).sort
  if nums.length % 2 == 0
    return (nums[nums.length/2-1] + nums[nums.length/2]) / 2.0
  else
    return nums[nums.length/2]
  end
end
