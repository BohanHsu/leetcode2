require 'minitest/autorun'
require '../first_missing_positive'

describe 'shuffle_nums(nums)' do
  it 'should work1' do
    len = rand(20)
    nums = len.times.map do |i|
      sign = rand(10)

      num = rand(60)

      sign > 3 ? num : -num
    end

    #puts "nums=#{nums}"
    shuffle_nums(nums)
    #puts "nums=#{nums}"
    check_shuffle_result(nums).must_equal(true)
  end
end

describe 'first_missing_positive(nums)' do
  it 'should work2' do

    nums = [1,2,0]
    expected_result = 3
    first_missing_positive(nums).must_equal(expected_result)

    nums = [3,4,-1,1]
    expected_result = 2
    first_missing_positive(nums).must_equal(expected_result)
  end
end

def check_shuffle_result(nums)
  nums.each_with_index do |e, i|
    if e > 0 && e != i + 1
      return false
    end
  end
  return true
end
