require 'minitest/autorun'
require '../find_peak_element'

describe 'find_peak_element(nums)' do
  it 'should work1' do
    nums = [1,2,3,4,1]
    brutal_force(nums).must_include(find_peak_element(nums))

    nums = [1,2,3,4,1,4,1,14,41,4,14,14,1]
    brutal_force(nums).must_include(find_peak_element(nums))

    nums = [1,2,3,4]
    brutal_force(nums).must_include(find_peak_element(nums))

    nums = [1,2,3,4].reverse
    brutal_force(nums).must_include(find_peak_element(nums))

    nums = [1,2]
    brutal_force(nums).must_include(find_peak_element(nums))

    nums = [1,2].reverse
    brutal_force(nums).must_include(find_peak_element(nums))

    nums = [1]
    brutal_force(nums).must_include(find_peak_element(nums))
  end
end

def brutal_force(nums)
  result = []
  nums.each_with_index do |val, i|
    #puts "nums=#{nums}"
    if i == 0 
      l_n = -Float::INFINITY
    else
      l_n = nums[i-1]
    end

    if i == nums.length - 1
      r_n = -Float::INFINITY
    else
      r_n = nums[i+1]
    end

    if l_n < val && r_n < val
      result << i
    end
    #puts "i=#{i}"
  end
  #puts "wtf"
  result
end
