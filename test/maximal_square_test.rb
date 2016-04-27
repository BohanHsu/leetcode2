require 'minitest/autorun'
require '../maximal_square'

describe 'max_in_line(line)' do
  it 'should work1' do
    line = [1,2,3,4,99,100,101,1,2]
    expected_result = 16
    max_in_line(line).must_equal(expected_result)

    line = [1,2,3,4,101,100,99,1,2]
    expected_result = 16
    max_in_line(line).must_equal(expected_result)

    line = [101,100,99,1,2]
    expected_result = 9
    max_in_line(line).must_equal(expected_result)

    line = [99,100,99,1,2]
    expected_result = 9
    max_in_line(line).must_equal(expected_result)

    line = [99,100,101,1,2]
    expected_result = 9
    max_in_line(line).must_equal(expected_result)

    line = [99,100,101]
    expected_result = 9
    max_in_line(line).must_equal(expected_result)

    line = [101,100,99]
    expected_result = 9
    max_in_line(line).must_equal(expected_result)

    line = [101,100,99,50,50,50,50]
    expected_result = 49
    max_in_line(line).must_equal(expected_result)

    line = [99,100,101,50,50,50,50]
    expected_result = 49
    max_in_line(line).must_equal(expected_result)

    line = [50,50,50,50,99,100,101]
    expected_result = 49
    max_in_line(line).must_equal(expected_result)

    line = [50,50,50,50,101,100,99]
    expected_result = 49
    max_in_line(line).must_equal(expected_result)
  end

  it 'should work5' do
    line = [0,4,3,5]
    expected_result = 9
    max_in_line(line).must_equal(expected_result)
  end
end

describe 'maximal_square(matrix)' do
  it 'should work2' do
    matrix = [
      "10100",
      "10111",
      "11111",
      "10010"
    ]


    expected_result = 4
    maximal_square(matrix).must_equal(expected_result)

    matrix = []
    expected_result = 0
    maximal_square(matrix).must_equal(expected_result)

    matrix = [[]]
    expected_result = 0
    maximal_square(matrix).must_equal(expected_result)
  end

  it 'should work3' do
    matrix = ["0"]
    expected_result = 0
    maximal_square(matrix).must_equal(expected_result)
  end

  it 'should work4' do
    matrix = [
      "0001",
      "1101",
      "1111",
      "0111",
      "0111"]
    expected_result = 9
    maximal_square(matrix).must_equal(expected_result)
  end
end
