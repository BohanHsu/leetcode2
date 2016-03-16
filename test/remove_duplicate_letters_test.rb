require 'minitest/autorun'
require '../remove_duplicate_letters'

describe 'remove_duplicate_letters(s)' do
  it 'should work1' do
    s = "bcabc"
    expected_result = "abc"
    remove_duplicate_letters(s).must_equal(expected_result)

    s = "cbacdcbc"
    expected_result = "acdb"
    remove_duplicate_letters(s).must_equal(expected_result)

    s = "cbadb"
    expected_result = "cadb"
    remove_duplicate_letters(s).must_equal(expected_result)

    s = ""
    expected_result = ""
    remove_duplicate_letters(s).must_equal(expected_result)
  end
end
