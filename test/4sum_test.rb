require 'minitest/autorun'
require '../4sum'

describe 'four_sum(nums, target)' do
  it 'should work1' do
    nums = [1, 0, -1, 0, -2, 2]
    target = 0
    expected_result = [
      [-1,  0, 0, 1],
      [-2, -1, 1, 2],
      [-2,  0, 0, 2]
    ]
    my_must_equal(expected_result, four_sum(nums, target))

    nums = [1,1,1,1]
    target = 100
    expected_result = [
    ]
    my_must_equal(expected_result, four_sum(nums, target))

    nums = [1,1,1,1]
    target = 0
    expected_result = [
    ]
    my_must_equal(expected_result, four_sum(nums, target))

    nums = [0,1,1]
    target = 2
    expected_result = [
    ]
    my_must_equal(expected_result, four_sum(nums, target))
  end
end

def my_must_equal(expected_result, actual)
  expected_result.each do |row|
    row.sort!
  end
  expected_result.sort!
  actual.each do |row|
    row.sort!
  end
  actual.sort!

  actual.must_equal(expected_result)
end
