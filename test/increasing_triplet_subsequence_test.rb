require 'minitest/autorun'
require '../increasing_triplet_subsequence'

describe 'increasing_triplet(nums)' do
  it 'should work1' do
    nums = [4,8,2,1,9]
    expected_result = true
    increasing_triplet(nums).must_equal(expected_result)

    nums = [4,8,2,1,2,7]
    expected_result = true
    increasing_triplet(nums).must_equal(expected_result)

    nums = [4,8,2,1,2,2]
    expected_result = false
    increasing_triplet(nums).must_equal(expected_result)

    nums = [4,8,2,1,7]
    expected_result = false
    increasing_triplet(nums).must_equal(expected_result)

    nums = [3,2,5,5,1,2,4]
    expected_result = true
    increasing_triplet(nums).must_equal(expected_result)

    nums = [3,2,5,5,2,2,6]
    expected_result = true
    increasing_triplet(nums).must_equal(expected_result)
  end

  it 'should work2' do
    nums = [2,4,-2,-3]
    expected_result = false
    increasing_triplet(nums).must_equal(expected_result)
  end
end
