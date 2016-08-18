require 'minitest/autorun'
require '../text_justification'

describe 'full_justify(words, max_width)' do
  it 'should work1' do
    words = ["This", "is", "an", "example", "of", "text", "justification."]
    max_width = 16

    expected_result = [
      "This    is    an",
      "example  of text",
      "justification.  "
    ]
    full_justify(words, max_width).must_equal(expected_result)

    words = [
      "12",
      "123",
      "1234",
      "12345"
    ]
    max_width = 5
    expected_result = [
      "12   ",
      "123  ",
      "1234 ",
      "12345"
    ]
    full_justify(words, max_width).must_equal(expected_result)

    words = ["What","must","be","shall","be."]
    max_width = 12
    expected_result = ["What must be","shall be.   "]
    full_justify(words, max_width).must_equal(expected_result)
  end
end
