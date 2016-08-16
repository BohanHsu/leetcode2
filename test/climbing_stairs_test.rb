require 'minitest/autorun'
require '../climbing_stairs'

describe 'climb_stairs(n)' do
  it 'should work1' do
    n = 0
    expected_result = 0
    climb_stairs(n).must_equal(expected_result)

    n = 1
    expected_result = 1
    climb_stairs(n).must_equal(expected_result)

    n = 3
    expected_result = 3
    climb_stairs(n).must_equal(expected_result)

    n = 4
    expected_result = 5
    climb_stairs(n).must_equal(expected_result)

    n = 5
    expected_result = 8
    climb_stairs(n).must_equal(expected_result)
  end
end
