require 'minitest/autorun'
require '../contains_duplicate'

describe 'contains_duplicate(nums)' do
  it 'should work1' do
    nums = [1,2,3,4,5,1]
    expected_result = true

    nums = [1,2,3,4,5]
    expected_result = false

    nums = []
    expected_result = false
  end
end
