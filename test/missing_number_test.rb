require 'minitest/autorun'
require '../missing_number'

describe 'missing_number(nums)' do
  it 'should work1' do
    nums = [0, 1, 3]
    expected_result = 2
    missing_number(nums).must_equal(expected_result)
  end
end
