require 'minitest/autorun'
require '../permutations'

describe 'permute(nums)' do
  it 'should work1' do
    nums = [1,2,3]
    expected_result = [
      [1,2,3],
      [1,3,2],
      [2,1,3],
      [2,3,1],
      [3,1,2],
      [3,2,1]
    ]
    permute(nums).sort.must_equal(expected_result.sort)

    nums = [1,2,3,4]
    expected_result = [
      [1,2,3,4],
      [1,3,2,4],
      [2,1,3,4],
      [2,3,1,4],
      [3,1,2,4],
      [3,2,1,4],

      [1,2,4,3],
      [1,3,4,2],
      [2,1,4,3],
      [2,3,4,1],
      [3,1,4,2],
      [3,2,4,1],

      [1,4,2,3],
      [1,4,3,2],
      [2,4,1,3],
      [2,4,3,1],
      [3,4,1,2],
      [3,4,2,1],

      [4,1,2,3],
      [4,1,3,2],
      [4,2,1,3],
      [4,2,3,1],
      [4,3,1,2],
      [4,3,2,1]
    ]
    permute(nums).sort.must_equal(expected_result.sort)
  end
end
