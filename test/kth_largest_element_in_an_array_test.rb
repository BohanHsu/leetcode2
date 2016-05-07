require 'minitest/autorun'
require '../kth_largest_element_in_an_array'

describe 'find_kth_largest(nums, k)' do
  it 'should work1' do
    nums = [1,5,3,2,4,7,8,6]
    nums.each do |k|
      find_kth_largest(nums, k).must_equal(9-k)
    end
  end

  it 'should work under presure' do
    t = 100
    len = 100
    t.times do
      rlen = rand(len)
      nums = rlen.times.map do
        rand(9999)
      end

      nums.sort.reverse.each_with_index do |ele, idx|
        find_kth_largest(nums, idx + 1).must_equal(ele)
      end
    end
  end
end
