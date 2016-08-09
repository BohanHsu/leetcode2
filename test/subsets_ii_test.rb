require 'minitest/autorun'
require '../subsets_ii'

describe 'subsets_with_dup(nums)' do
  it 'should work1' do
    nums = [1,2,2]
    expected_result = [
      [2],
      [1],
      [1,2,2],
      [2,2],
      [1,2],
      []
    ]
    subsets_with_dup(nums).sort.must_equal(expected_result.sort)

    nums = [1,1,1]
    expected_result = [
      [1],
      [1,1],
      [1,1,1],
      []
    ]
    subsets_with_dup(nums).sort.must_equal(expected_result.sort)

    nums = []
    expected_result = [
      []
    ]
    subsets_with_dup(nums).sort.must_equal(expected_result.sort)
  end

  it 'should work2' do
    nums = [1,1,2,2]
    expected_result = [[],[1],[1,1],[1,1,2],[1,1,2,2],[1,2],[1,2,2],[2],[2,2]]
    subsets_with_dup(nums).sort.must_equal(expected_result.sort)
  end
end
