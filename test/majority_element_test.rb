require 'minitest/autorun'
require '../majority_element'

describe 'majority_element(nums)' do
  it 'should work' do
    (1..100).each do |i|
      expected_result = 1
      nums = [expected_result] * expected_result + (1..(expected_result - 1)).map {|i| i}
      nums.shuffle
      majority_element(nums).must_equal(expected_result)
    end
  end
end
