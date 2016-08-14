require 'minitest/autorun'
require '../search_in_rotated_sorted_array'

describe 'search(nums, target)' do
  it 'should work1' do
    k = 50
    nums = k.times.map do |i|
      i
    end

    k.times do |i|
      nums1 = nums[i+1...k] + nums[0..i]

      ((-k)..(2 * k)).each do |j|
        expected_result = nums1.index(j)
        expected_result = expected_result.nil? ? -1 : expected_result
        search(nums1, j).must_equal(expected_result)
      end
    end
  end

  it 'should work2' do
  end
end
