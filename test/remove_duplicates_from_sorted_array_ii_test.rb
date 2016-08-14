require 'minitest/autorun'
require '../remove_duplicates_from_sorted_array_ii'

describe 'remove_duplicates(nums)' do
  it 'should work1' do
    nums = [1,1,1,2,2,3]
    expected_result = 5
    new_nums = [1,1,2,2,3]
    remove_duplicates(nums).must_equal(expected_result)
    new_nums.each_with_index do |e, i|
      nums[i].must_equal(e)
    end
  end

  it 'should work2' do
    nums = [1,1,1,2,2,3,3,3]
    expected_result = 6
    new_nums = [1,1,2,2,3,3]
    remove_duplicates(nums).must_equal(expected_result)
    new_nums.each_with_index do |e, i|
      nums[i].must_equal(e)
    end
  end
end
