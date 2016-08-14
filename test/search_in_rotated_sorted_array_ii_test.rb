require 'minitest/autorun'
require '../search_in_rotated_sorted_array_ii'

describe 'search(nums, target)' do
  it 'should work1' do
    k = 50
    nums = k.times.map do |i|
      i
    end

    k.times do |i|
      nums1 = nums[i+1...k] + nums[0..i]

      ((-k)..(2 * k)).each do |j|
        expected_result = nums1.include?(j)
        search(nums1, j).must_equal(expected_result)
      end
    end
  end

  it 'should work2' do
    k = 50
    nums = k.times.map do |i|
      i
    end

    k.times do |i|
      nums1 = nums[i+1...k] + ([nums[k-1]] * (k/2)) + nums[0..i] + ([nums[i]] * (k/2))

      ((-k)..(2 * k)).each do |j|
        expected_result = nums1.include?(j)
        search(nums1, j).must_equal(expected_result)
      end
    end
  end

  it 'should work3' do
    nums=[2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 49, 49, 49, 49, 49, 49, 49, 49, 49, 49, 49, 49, 49, 49, 49, 49, 49, 49, 49, 49, 49, 49, 49, 49, 49, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
    target=0
    nums1 = nums
    j = target

    expected_result = nums1.include?(j)
    search(nums1, j).must_equal(expected_result)
  end

  it 'should work4' do
    nums=[1]
    target=0
    nums1 = nums
    j = target

    expected_result = nums1.include?(j)
    search(nums1, j).must_equal(expected_result)
  end
end
