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

  it 'should work7' do
    line = [3,3,4,0]
    expected_result = 9
    max_in_line(line).must_equal(expected_result)
  end

  it 'should work9' do
    line = [2,5,3,4,1]
    expected_result = 9
    max_in_line(line).must_equal(expected_result)
  end

  it 'should work11' do
    line = [0, 5, 5, 5, 5, 0, 0, 0]
    expected_result = 16
    max_in_line(line).must_equal(expected_result)
  end

  

end

describe 'maximal_square(matrix)' do
  it 'should work2' do
    matrix = [
      "10100".chars,
      "10111".chars,
      "11111".chars,
      "10010".chars
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
    matrix = [["0"]]
    expected_result = 0
    maximal_square(matrix).must_equal(expected_result)
  end

  it 'should work4' do
    matrix = [
      "0001".chars,
      "1101".chars,
      "1111".chars,
      "0111".chars,
      "0111".chars]
    expected_result = 9
    maximal_square(matrix).must_equal(expected_result)
  end

  it 'should work6' do
    matrix = [
      "0010".chars,
      "1111".chars,
      "1111".chars,
      "1110".chars,
      "1100".chars,
      "1111".chars,
      "1110".chars]
    expected_result = 9
    maximal_square(matrix).must_equal(expected_result)
  end

  

  it 'should work8' do
    matrix = [
      "01101".chars,
      "11010".chars,
      "01110".chars,
      "11110".chars,
      "11111".chars,
      "00000".chars
    ]
    expected_result = 9
    maximal_square(matrix).must_equal(expected_result)
  end

  it 'should work10' do
    
    matrix = [
      "11111111".chars,
      "11111110".chars,
      "11111110".chars,
      "11111000".chars,
      "01111000".chars]
    expected_result = 16
    maximal_square(matrix).must_equal(expected_result)
  end
end
