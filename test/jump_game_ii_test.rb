require 'minitest/autorun'
require '../jump_game_ii'

describe 'jump(nums)' do
  it 'should work1' do
    nums = [2,1,1,2,3]
    expected_result = 3
    jump(nums).must_equal(expected_result)

    nums = [2,1,2,2,3]
    expected_result = 2
    jump(nums).must_equal(expected_result)

    nums = []
    expected_result = 0
    jump(nums).must_equal(expected_result)

    nums = [1]
    expected_result = 0
    jump(nums).must_equal(expected_result)
  end

  it 'should work2' do
    nums = [7,0,9,6,9,6,1,7,9,0,1,2,9,0,3]
    expected_result = 2
    jump(nums).must_equal(expected_result)
  end
end
