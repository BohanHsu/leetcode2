require 'minitest/autorun'
require '../permutations_ii'

describe 'permute_unique(nums)' do
  it 'should work1' do
    nums = [1,1,2]
    expected_result = [
      [1,1,2],
      [1,2,1],
      [2,1,1]
    ]
    permute_unique(nums).sort.must_equal(expected_result.sort)
  end

  it 'should work2' do
    nums = [1,1]
    expected_result = [
      [1,1]
    ]
    permute_unique(nums).sort.must_equal(expected_result.sort)
  end
end
