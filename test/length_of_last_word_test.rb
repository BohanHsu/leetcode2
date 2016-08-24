require 'minitest/autorun'
require '../length_of_last_word'

describe 'length_of_last_word(s)' do
  it 'should work1' do
    s = "Hello World"
    expected_result = 5
    length_of_last_word(s).must_equal(expected_result)

    s = "Hello"
    expected_result = 5
    length_of_last_word(s).must_equal(expected_result)

    s = "Hello "
    expected_result = 5
    length_of_last_word(s).must_equal(expected_result)

    s = " Hello "
    expected_result = 5
    length_of_last_word(s).must_equal(expected_result)

    s = " Hello"
    expected_result = 5
    length_of_last_word(s).must_equal(expected_result)

    s = "      "
    expected_result = 0
    length_of_last_word(s).must_equal(expected_result)
  end
end
