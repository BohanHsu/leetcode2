require 'minitest/autorun'
require '../next_permutation'

describe 'next_permutation(nums)' do
  it 'should work1' do
    permutations = [
      "1234",
      "1243",
      "1324",
      "1342",
      "1423",
      "1432"
    ].map do |ele|
      ele.chars.map(&:to_i)
    end


    permutations.each_with_index do |ele, i|
      if i < permutations.length - 1
        nums = ele.clone
        next_permutation(nums)
        nums.must_equal(permutations[i+1])
      end
    end
  end

  it 'should work2' do
    nums = [1,1,5]
    expected_result = [1,5,1]
    next_permutation(nums)
    nums.must_equal(expected_result)
  end

  it 'should work3' do
    nums = [5,1,1]
    expected_result = [1,1,5]
    next_permutation(nums)
    nums.must_equal(expected_result)

    nums = [3,2,1]
    expected_result = [1,2,3]
    next_permutation(nums)
    nums.must_equal(expected_result)
  end

  it 'should work4' do
    nums = [2,3,1,3,3]
    expected_result = [2,3,3,1,3]
    next_permutation(nums)
    nums.must_equal(expected_result)

    nums = [2,3,1,3,3,3,3]
    expected_result = [2,3,3,1,3,3,3]
    next_permutation(nums)
    nums.must_equal(expected_result)
  end
end
