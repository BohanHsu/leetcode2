require 'minitest/autorun'
require '../minimum_window_substring'

describe 'min_window(s, t)' do
  it 'should work1' do
    s = "ADOBECODEBANC"
    t = "ABC"
    expected_result = "BANC"
    min_window(s, t).must_equal(expected_result)

    s = "ADOBECODEBANC"
    t = "AYBC"
    expected_result = ""
    min_window(s, t).must_equal(expected_result)

    s = "ABCDEFGH"
    t = "ABDCFEHG"
    expected_result = "ABCDEFGH"
    min_window(s, t).must_equal(expected_result)

    s = "ABCDEFGH"
    t = "ABDCFEHGA"
    expected_result = ""
    min_window(s, t).must_equal(expected_result)
  end
end
