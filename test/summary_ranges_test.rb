require 'minitest/autorun'
require '../summary_ranges'

describe 'summary_ranges(nums)' do
  it 'should work1' do
    nums = [0,1,2,4,5,7]
    expected_result = ["0->2","4->5","7"]
    summary_ranges(nums).must_equal(expected_result)

    nums = [0,1,2,4,6,7]
    expected_result = ["0->2","4","6->7"]
    summary_ranges(nums).must_equal(expected_result)
  end
end
