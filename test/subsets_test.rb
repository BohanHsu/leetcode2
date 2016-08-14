require 'minitest/autorun'
require '../subsets'

describe 'subsets(nums)' do
  it 'should work1' do
    nums = [1,2,3]
    expected_result = [
      [3],
      [1],
      [2],
      [1,2,3],
      [1,3],
      [2,3],
      [1,2],
      []
    ]
    subsets(nums).sort.must_equal(expected_result.sort)

    nums = []
    expected_result = [
      []
    ]
    subsets(nums).sort.must_equal(expected_result.sort)
  end
end
