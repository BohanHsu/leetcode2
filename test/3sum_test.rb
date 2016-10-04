require 'minitest/autorun'
require '../3sum'

describe 'three_sum(nums)' do
  it 'should work1' do
    nums = [-1, 0, 1, 2, -1, -4]
    expected_result = [
      [-1, 0, 1],
      [-1, -1, 2]
    ]
    three_sum(nums).sort.must_equal(expected_result.sort)

    nums = [-1, 0, 0, 0, 1, 2, -1, -4]
    expected_result = [
      [-1, 0, 1],
      [-1, -1, 2],
      [0, 0, 0]
    ]
    three_sum(nums).sort.must_equal(expected_result.sort)
  end

  it 'should work2' do
    nums = [-1,1]
    expected_result = []
    three_sum(nums).sort.must_equal(expected_result.sort)
  end
end
