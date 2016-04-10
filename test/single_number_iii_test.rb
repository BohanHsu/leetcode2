require 'minitest/autorun'
require '../single_number_iii'

describe 'single_number(nums)' do
  it 'should work1' do
    nums = [1, 2, 1, 3, 2, 5]
    expected_result = [3, 5]
    single_number(nums).sort.must_equal(expected_result.sort)

    nums = [3, 5]
    expected_result = [3, 5]
    single_number(nums).sort.must_equal(expected_result.sort)
    
    nums = [-1, -2, -1, -3, -2, -5]
    expected_result = [-3, -5]
    single_number(nums).sort.must_equal(expected_result.sort)
  end
end
