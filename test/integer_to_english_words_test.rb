require 'minitest/autorun'
require '../integer_to_english_words'

describe 'number_to_words(num)' do
  it 'should work2' do
    num = 0
    expected_result = "Zero"
    number_to_words(num).must_equal(expected_result)

    num = 123
    expected_result = "One Hundred Twenty Three"
    number_to_words(num).must_equal(expected_result)

    num = 12345
    expected_result = "Twelve Thousand Three Hundred Forty Five"
    number_to_words(num).must_equal(expected_result)

    num = 1234567
    expected_result = "One Million Two Hundred Thirty Four Thousand Five Hundred Sixty Seven"
    number_to_words(num).must_equal(expected_result)

    num = 6001234567
    expected_result = "Six Billion One Million Two Hundred Thirty Four Thousand Five Hundred Sixty Seven"
    number_to_words(num).must_equal(expected_result)
  end

  it 'should work3' do
    num = 1000
    expected_result = "One Thousand"
    number_to_words(num).must_equal(expected_result)

    num = 1000000
    expected_result = "One Million"
    number_to_words(num).must_equal(expected_result)
  end
end

describe 'array_to_str(array)' do
  it 'should work1' do
    array = [1]
    expected_result = 'One'
    array_to_str(array).must_equal(expected_result)

    array = [1,1]
    expected_result = 'Eleven'
    array_to_str(array).must_equal(expected_result)

    array = [2,1]
    expected_result = 'Twenty One'
    array_to_str(array).must_equal(expected_result)

    array = [3,2,1]
    expected_result = 'Three Hundred Twenty One'
    array_to_str(array).must_equal(expected_result)

    array = [3,0,1]
    expected_result = 'Three Hundred One'
    array_to_str(array).must_equal(expected_result)

    array = [3,0,0]
    expected_result = 'Three Hundred'
    array_to_str(array).must_equal(expected_result)
  end
end
