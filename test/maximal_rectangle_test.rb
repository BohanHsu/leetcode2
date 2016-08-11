require 'minitest/autorun'
require '../maximal_rectangle.rb'

describe 'maximal_rectangle_line(line)' do
  it 'should work1' do
    line = [5,6,100,101,7,8]
    expected_result = 200
    maximal_rectangle_line(line).must_equal(expected_result)

    line = [5,6,10,11,7,8]
    expected_result = 30
    maximal_rectangle_line(line).must_equal(expected_result)

    line = [5,6,101,100,7,8]
    expected_result = 200
    maximal_rectangle_line(line).must_equal(expected_result)

    line = [101,100,7,8]
    expected_result = 200
    maximal_rectangle_line(line).must_equal(expected_result)

    line = [101,102,100,7,8]
    expected_result = 300
    maximal_rectangle_line(line).must_equal(expected_result)

    line = [101,100,102,7,8]
    expected_result = 300
    maximal_rectangle_line(line).must_equal(expected_result)

    line = [103,102,100,7,8]
    expected_result = 300
    maximal_rectangle_line(line).must_equal(expected_result)

    line = [101,102,100]
    expected_result = 300
    maximal_rectangle_line(line).must_equal(expected_result)

    line = [101,100,102]
    expected_result = 300
    maximal_rectangle_line(line).must_equal(expected_result)

    line = [103,102,100]
    expected_result = 300
    maximal_rectangle_line(line).must_equal(expected_result)
  end

  it 'should work2' do
  end
end

describe 'maximal_rectangle(matrix)' do
  it 'should work3' do
    matrix = [
      "10100".chars,
      "10111".chars,
      "11111".chars,
      "10010".chars
    ]
    expected_result = 6
    maximal_rectangle(matrix).must_equal(expected_result)

    matrix = [
      []
    ]
    expected_result = 0
    maximal_rectangle(matrix).must_equal(expected_result)

    matrix = [
    ]
    expected_result = 0
    maximal_rectangle(matrix).must_equal(expected_result)
  end
  
  it 'should work4' do
  end
end
