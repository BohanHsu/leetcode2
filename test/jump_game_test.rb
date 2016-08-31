require 'minitest/autorun'
require '../jump_game'

describe 'can_jump(nums)' do
  it 'should work1' do
    nums = [2,3,1,1,4]
    expected_result = true
    can_jump(nums).must_equal(expected_result)

    nums = [3,2,1,0,4]
    expected_result = false
    can_jump(nums).must_equal(expected_result)

    nums = []
    expected_result = true
    can_jump(nums).must_equal(expected_result)
  end
end
