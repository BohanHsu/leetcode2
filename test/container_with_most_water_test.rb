require 'minitest/autorun'
require '../container_with_most_water'

describe 'max_area(height)' do
  it 'should work1' do
    height = [4,2,7,15,14,5]
    expected_result = 20
    max_area(height).must_equal(expected_result)

    height = [1,2]
    expected_result = 1
    max_area(height).must_equal(expected_result)

    height = [2,1,2]
    expected_result = 4
    max_area(height).must_equal(expected_result)

    height = [2]
    expected_result = 0
    max_area(height).must_equal(expected_result)

    height = [2,3,10,5,7,8,9]
    expected_result = 36
    max_area(height).must_equal(expected_result)

    height = [2,1]
    expected_result = 1
    max_area(height).must_equal(expected_result)

    height = [2,3,4,5,18,17,6]
    expected_result = 17
    max_area(height).must_equal(expected_result)

    height = [6,4,3,1,4,6,99,62,1,2,6]
    expected_result = 62
    max_area(height).must_equal(expected_result)

    height = [10,9,8,7,6,5,4,3,2,1]
    expected_result = 25
    max_area(height).must_equal(expected_result)

    height = [1,2,3,4,5,6,7,8,9,10]
    expected_result = 25
    max_area(height).must_equal(expected_result)

    height = [5,2,12,1,5,3,4,11,9,4]
    expected_result = 55
    max_area(height).must_equal(expected_result)
  end

  it 'should work2' do
    height = [9,6,14,11,2,2,4,9,3,8]
    expected_result = 72
    max_area(height).must_equal(expected_result)
  end
end
