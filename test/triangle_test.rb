require 'minitest/autorun'
require '../triangle'

describe 'minimum_total(triangle)' do
  it 'should work1' do
    triangle = [
      [2],
      [3,4],
      [6,5,7],
      [4,1,8,3]
    ]
    expected_result = 11
    minimum_total(triangle).must_equal(expected_result)

    triangle = [
      [2]
    ]
    expected_result = 2
    minimum_total(triangle).must_equal(expected_result)

    triangle = [
      [1],
      [1,4],
      [1,5,7],
      [1,1,8,3]
    ]
    expected_result = 4
    minimum_total(triangle).must_equal(expected_result)
  end
end
