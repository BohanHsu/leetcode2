require 'minitest/autorun'
require '../majority_element_ii'

describe 'majority_element(nums)' do
  it 'should work1' do
    (1..1000).each do |j|
      expected_result = j
      nums = [expected_result] * expected_result + (1..expected_result).map {|i| i} + ((expected_result + 1)..(expected_result * 2)).map {|i| i}
      nums.shuffle
      majority_element(nums).sort.must_equal([expected_result])
    end
  end

  it 'should work2' do
    (1..1000).each do |j|
      expected_result = j
      nums = [expected_result, (expected_result + 1)] * expected_result + (1...expected_result).map {|i| i}
      nums.shuffle
      majority_element(nums).sort.must_equal([expected_result, expected_result + 1])
    end
  end

  it 'should work3' do
      nums = []
      majority_element(nums).sort.must_equal([])
  end

  it 'should work4' do
      nums = [0,-1,2,-1]
      majority_element(nums).sort.must_equal([-1])
  end

  it 'should work4' do
      nums = [1,2,2,3,2,1,1,3]
      majority_element(nums).sort.must_equal([1, 2])
  end

  
end
