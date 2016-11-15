require 'minitest/autorun'
require '../zigzag_conversion'

describe 'num_of_element_in_row(j, len, num_rows)' do
  it 'should work1' do
    s = "PAHNAPLSIIGYIR"
    num_rows = 3
    actual_result = (0...num_rows).each.map do |j|
      num_of_element_in_row(j, s.length, num_rows)
    end
    expected_result = [4,7,3]
    actual_result.must_equal(expected_result)
  end

  it 'should work7' do
    s = "abcde"
    num_rows = 4
    actual_result = (0...num_rows).each.map do |j|
      num_of_element_in_row(j, s.length, num_rows)
    end
    expected_result = [1,1,2,1]
  end
end

describe 'old_index_to_coordinate(n, num_rows)' do
  it 'should work2' do
    s = "PAHNAPLSIIGYIR"
    num_rows = 3
    expected_result = [[0,0], [1,0], [2,0], [1,1], [0,2], [1,2], [2,2], [1,3],
    [0,4], [1,4], [2,4], [1,5], [0,6], [1,6]]
    (0...s.length).each do |n|
      old_index_to_coordinate(n, num_rows).must_equal(expected_result[n])
    end
  end

  it 'should work3' do
    s = "PAHNAPLSIIGYIR"
    num_rows = 3
    expected_result = [[0,0], [1,0], [2,0], [1,1], [0,2], [1,2], [2,2], [1,3],
    [0,4], [1,4], [2,4], [1,5], [0,6], [1,6]]
    n = 8
    old_index_to_coordinate(n, num_rows).must_equal(expected_result[n])
  end
end

describe 'coordinate_to_new_index(i, j, num_rows, elems_before_row)' do
  it 'should work4' do
    arr = [[0,0], [1,0], [2,0], [1,1], [0,2], [1,2], [2,2], [1,3],
    [0,4], [1,4], [2,4], [1,5], [0,6], [1,6]]
    elems_before_row = [0,4,11]
    num_rows = 3
    expected_result = [0, 4, 11, 5, 1, 6, 12, 7, 2, 8, 13, 9, 3, 10]
    arr.each_with_index do |pair, k|
      i, j = pair
      coordinate_to_new_index(i, j ,num_rows, elems_before_row).must_equal(expected_result[k])
    end
  end

end

describe 'convert(s, num_rows)' do
  it 'should work5' do
    s = "PAYPALISHIRING"
    expected_result = "PAHNAPLSIIGYIR"
    num_rows = 3
    convert(s, num_rows).must_equal(expected_result)

    s = "abcdefghijklmnopqrstuvwxyz"
    num_rows = 4
    expected_result = "agmsybfhlnrtxzceikoquwdjpv"
    convert(s, num_rows).must_equal(expected_result)

    num_rows = 5
    expected_result = "aiqybhjprxzcgkoswdflntvemu"
    convert(s, num_rows).must_equal(expected_result)

    s = "a"
    num_rows = 5
    expected_result = "a"
    convert(s, num_rows).must_equal(expected_result)

    s = "ab"
    num_rows = 5
    expected_result = "ab"
    convert(s, num_rows).must_equal(expected_result)

    s = "ab"
    num_rows = 1
    expected_result = "ab"
    convert(s, num_rows).must_equal(expected_result)

    s = "abc"
    num_rows = 3
    expected_result = "abc"
    convert(s, num_rows).must_equal(expected_result)
  end

  it 'should work6' do
    s = "ABCDE"
    num_rows = 4
    expected_result = "ABCED"
    convert(s, num_rows).must_equal(expected_result)
  end
end
