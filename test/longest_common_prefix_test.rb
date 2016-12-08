require 'minitest/autorun'
require '../longest_common_prefix'

describe 'longest_common_prefix(strs)' do
  it 'should work1' do
    strs = [
      "abcde43",
      "abcde123",
      "abcsdflak;jdfde",
      "aflak;jdfde"
    ]
    expected_result = "a"
    longest_common_prefix(strs).must_equal(expected_result)

    strs = [
      "abcde43",
      "abcde123",
      "abcsdflak;jdfde",
    ]
    expected_result = "abc"
    longest_common_prefix(strs).must_equal(expected_result)

    strs = [
      "",
      "abcde123",
      "abcsdflak;jdfde",
    ]
    expected_result = ""
    longest_common_prefix(strs).must_equal(expected_result)

    strs = [
      ""
    ]
    expected_result = ""
    longest_common_prefix(strs).must_equal(expected_result)
  end
end
