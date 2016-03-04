require 'minitest/autorun'
require '../patching_array'

describe 'min_patches(nums, n)' do
  it 'should work1' do
    nums = [1,5,10]
    n = 20
    expected_result = 2
    min_patches(nums, n).must_equal(expected_result)

    nums = [1,3]
    n = 6
    expected_result = 1
    min_patches(nums, n).must_equal(expected_result)

    nums = [1,2,2]
    n = 5
    expected_result = 0
    min_patches(nums, n).must_equal(expected_result)

    nums = [1,1,4]
    n = 10
    expected_result = 2
    min_patches(nums, n).must_equal(expected_result)
  end

  it 'should work2' do
    nums = []
    n = 10
    expected_result = 4
    min_patches(nums, n).must_equal(expected_result)

    nums = [1]
    n = 10
    expected_result = 3
    min_patches(nums, n).must_equal(expected_result)

    nums = [2]
    n = 10
    expected_result = 3
    min_patches(nums, n).must_equal(expected_result)

    nums = [4]
    n = 10
    expected_result = 3
    min_patches(nums, n).must_equal(expected_result)
  end

  it 'should work3' do
    nums = [1,2,32]
    n = 2147483647
    expected_result = 28
    min_patches(nums, n).must_equal(expected_result)
  end
  
  it 'should work4' do
    nums = [1,2,32]
    n = 1
    expected_result = 0
    min_patches(nums, n).must_equal(expected_result)

    nums = [1,2,32]
    n = 2
    expected_result = 0
    min_patches(nums, n).must_equal(expected_result)
  end
end
